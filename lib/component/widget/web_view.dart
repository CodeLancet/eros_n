import 'dart:async';
import 'dart:io';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/l10n/generated/app_localizations.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class WebViewCookieInfo {
  const WebViewCookieInfo({
    required this.url,
    required this.cookies,
    required this.userAgent,
    this.currentUrl,
    this.manualRequired = false,
    this.message,
  });

  @override
  String toString() {
    return 'WebViewCookieInfo<MR:$manualRequired, $message, $userAgent, '
        'currentUrl=$currentUrl, $cookies>';
  }

  /// Origin/base URL the cookies belong to (typically [NHConst.baseUrl]).
  final String url;

  /// The URL the WebView is currently displaying. Useful for callers that
  /// want to detect navigation events such as a successful login redirect.
  final String? currentUrl;

  final List<Cookie> cookies;
  final String userAgent;
  final bool manualRequired;
  final String? message;
}

typedef WebViewCallback = Function(WebViewCookieInfo);

/// Build the URL we should land on first inside the cookie-fetching WebView.
/// Callers may pass either [NHConst.baseUrl] (no path) or [NHConst.loginUrl]
/// (already `/login/`) — both should end up loading the login page exactly
/// once instead of `/login/login/`.
String _resolveLoginEntryUrl(String input) {
  final uri = Uri.parse(input);
  final path = uri.path;
  if (path.contains('/login')) {
    return uri.toString();
  }
  final base = path.endsWith('/')
      ? input.substring(0, input.length - 1)
      : input;
  return '$base/login/';
}

/// Parse browser `document.cookie` string into a list of Cookies.
List<Cookie> _parseDocumentCookie(String raw) {
  final result = <Cookie>[];
  for (final part in raw.split(';')) {
    final eq = part.indexOf('=');
    if (eq <= 0) {
      continue;
    }
    final name = part.substring(0, eq).trim();
    final value = part.substring(eq + 1).trim();
    if (name.isEmpty) {
      continue;
    }
    result.add(Cookie(name, value));
  }
  return result;
}

WebViewCookie? _findCookie(List<WebViewCookie> cookies, String name) {
  for (final c in cookies) {
    if (c.name == name) {
      return c;
    }
  }
  return null;
}

/// Single WebView implementation for every platform, backed by `webview_all`.
///
/// There used to be two parallel implementations — InAppWebView on
/// Android/iOS and webview_flutter_windows on Windows. Both packages are now
/// replaced by one API surface, so the cookie-sync and challenge-detection
/// logic lives in a single place.
///
/// Note: `webview_all`'s cross-platform cookie model only carries
/// name/value/domain/path (no expires/httpOnly/secure), so cookies handed to
/// [WebViewCallback] lose those attributes.
class WebView extends StatefulWidget {
  const WebView({
    super.key,
    required this.url,
    this.callback,
    this.deletedCookie = true,
  });

  final WebViewCallback? callback;
  final String url;
  final bool deletedCookie;

  @override
  State<WebView> createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  late final WebViewController _controller;
  final WebViewCookieManager _cookieManager = WebViewCookieManager();

  bool _initialized = false;
  String url = '';

  Timer? anomalyTimer;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController(
      onPermissionRequest: _onPermissionRequested,
    );
    _initWebView();
    if (widget.callback != null) {
      anomalyTimer = Timer.periodic(const Duration(seconds: 1), anomalyMonitor);
    }
  }

  Future<void> anomalyMonitor(Timer timer) async {
    if (mounted && _initialized) {
      callbackChallengeInfo();
    }
  }

  Future<void> _initWebView() async {
    if (widget.deletedCookie) {
      try {
        await _cookieManager.clearCookies();
      } catch (e) {
        logger.d('clearCookies failed: $e');
      }
    }
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(NHConst.userAgent)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) async {
            url = request.url;
            return NavigationDecision.navigate;
          },
          onPageStarted: (pageUrl) {
            url = pageUrl;
          },
          onPageFinished: (pageUrl) async {
            url = pageUrl;
            await _onPageLoaded();
          },
          onWebResourceError: (error) {
            logger.w(
              '[WebView] onWebResourceError ${error.description} '
              'url=${error.url}',
            );
          },
        ),
      )
      ..setOnConsoleMessage((msg) {
        logger.t('[WebView console] ${msg.level}: ${msg.message}');
      });
    if (!mounted) {
      return;
    }
    setState(() => _initialized = true);
    await _controller.loadRequest(Uri.parse(_resolveLoginEntryUrl(widget.url)));
  }

  /// Runs once the page finishes loading: kill any Service Worker that may
  /// be intercepting requests, probe whether the WebView holds a live
  /// cf_clearance, and sync cookies to the callback.
  Future<void> _onPageLoaded() async {
    try {
      await _controller.runJavaScriptReturningResult('''
(async function() {
  try {
    if (navigator.serviceWorker) {
      const rs = await navigator.serviceWorker.getRegistrations();
      for (const r of rs) { await r.unregister(); }
    }
    if (window.caches) {
      const ks = await caches.keys();
      for (const k of ks) { await caches.delete(k); }
    }
  } catch(e) {}
})();
''');
    } catch (_) {}

    // Probe whether the WebView actually has a working cf_clearance by
    // hitting a real API that requires it.
    try {

      final probe = await _controller.callAsyncJavaScript('''
          try {
            const r = await fetch('/api/galleries/all?page=1', {credentials:'include'});
            return JSON.stringify({status:r.status});
          } catch(e) { return 'err:'+e.toString(); }
        ''');
      logger.d('cfProbe=$probe');
    } catch (e) {
      logger.e('cfProbe threw: $e');
    }

    // Try to fish out cf_clearance via a few URL/path variants.
    for (final u in [
      'https://nhentai.net/',
      'https://nhentai.net',
      'http://nhentai.net/',
      'https://.nhentai.net/',
      'https://www.nhentai.net/',
    ]) {
      try {
        final cookies = await _cookieManager.getCookies(domain: Uri.parse(u));
        final c = _findCookie(cookies, 'cf_clearance');
        logger.d(
          'cfClearance@$u => ${c?.value != null ? "FOUND len=${c!.value.length}" : "null"}',
        );
        if (c != null) {
          break;
        }
      } catch (e) {
        logger.d('cfClearance@$u failed: $e');
      }
    }
    // Force a sync from the native cookie manager so newly-issued Set-Cookie
    // headers from the page load are visible.
    try {
      await _cookieManager.getCookies(domain: Uri.parse('${NHConst.baseUrl}/'));
    } catch (_) {}
    callbackChallengeInfo();
  }

  /// Merge the native cookie manager's cookies with anything visible via
  /// `document.cookie` (some servers issue cookies through JS-set headers
  /// the native manager fails to enumerate).
  Future<List<Cookie>> _readCookies() async {
    final rawCookies = await _cookieManager.getCookies(
      domain: Uri.parse('${NHConst.baseUrl}/'),
    );
    final ioCookies = rawCookies
        .map(
          (e) => Cookie(e.name, e.value)
            ..domain = e.domain
            ..path = e.path,
        )
        .toList();

    final raw = await _controller.runJavaScriptReturningResult(
      'document.cookie',
    );
    if (raw is String && raw.isNotEmpty) {
      final existing = ioCookies.map((e) => e.name).toSet();
      for (final c in _parseDocumentCookie(raw)) {
        if (!existing.contains(c.name)) {
          ioCookies.add(c);
        }
      }
    }
    return ioCookies;
  }

  Future callbackChallengeInfo() async {
    if (!_initialized) {
      return;
    }
    final ioCookies = await _readCookies();
    final currentUrl = await _controller.currentUrl();
    final pageInfo = await _controller.runJavaScriptReturningResult(
      '(function(){return JSON.stringify({title:document.title,bodyLen:(document.body&&document.body.innerText||"").length,readyState:document.readyState,hasCookie:document.cookie.length>0,docCookie:document.cookie});})()',
    );
    final ua = await _controller.runJavaScriptReturningResult(
      'navigator.userAgent',
    );
    logger.d(
      'callbackChallengeInfo url=$currentUrl, '
      'finalCount=${ioCookies.length}, '
      'cookieNames=[${ioCookies.map((e) => e.name).join(",")}], '
      'page=$pageInfo',
    );
    widget.callback?.call(
      WebViewCookieInfo(
        url: NHConst.baseUrl,
        currentUrl: currentUrl,
        cookies: ioCookies,
        userAgent: ua is String ? ua : '',
        // Only show the WebView UI when interaction is actually required
        // (DOM has visible challenge widgets), or when JS challenge has been
        // running for too long without resolving.
        manualRequired:
            (anomalyTimer?.tick ?? 0) >= 30 || await getManualRequired(),
        message: await getChallengeMessage(),
      ),
    );
  }

  Future<bool> getManualRequired() async {
    // Only return true when we're actually on a Cloudflare challenge page.
    // Detect by document.title ("Just a moment..."), URL path
    // (/cdn-cgi/challenge-platform/), or known challenge containers.
    final manualRequiredText = await _controller.runJavaScriptReturningResult(
      '''
          (function() {
            var onChallengePage = document.title.indexOf('Just a moment') !== -1
              || document.title.indexOf('Please Wait') !== -1
              || document.querySelector('#challenge-form') != null
              || document.querySelector('#challenge-stage') != null
              || document.querySelector('#cf-challenge-running') != null;
            if (!onChallengePage) return null;
            // On challenge page, check whether interactive elements are
            // present (managed challenge / Turnstile checkbox / captcha).
            var needsClick = document.querySelector('#challenge-stage input[type=checkbox]') != null
              || document.querySelector('.pow-button') != null
              || document.querySelector('.captcha-prompt') != null
              || document.querySelector('iframe[src*="challenges.cloudflare.com"]') != null;
            return needsClick ? 'true' : null;
          })()
        ''',
    );
    return manualRequiredText == 'true';
  }

  Future<String?> getChallengeMessage() async {
    final String msg =
        await _controller.runJavaScriptReturningResult(
              '(document.querySelector("#challenge-body-text") != null) ? document.querySelector("#challenge-body-text").textContent : ""',
            )
            as String;
    return msg.trim();
  }

  Future<void> _onPermissionRequested(WebViewPermissionRequest request) async {
    final resourceNames = request.types.map((t) => t.name).join(', ');
    try {
      final allow = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(AppLocalizations.of(context).webview_permission_title),
          content: Text(
            AppLocalizations.of(
              context,
            ).webview_permission_content(resourceNames),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(AppLocalizations.of(context).deny),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(AppLocalizations.of(context).allow),
            ),
          ],
        ),
      );
      if (allow == true) {
        await request.grant();
      } else {
        await request.deny();
      }
    } catch (e) {
      logger.d('permission request handling failed: $e');
    }
  }

  Future reload() async {
    try {
      await _controller.reload();
    } catch (e) {
      logger.d('reload failed: $e');
    }
  }

  @override
  void dispose() {
    anomalyTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}

class GetCookieWebView extends StatefulWidget {
  const GetCookieWebView({
    required this.url,
    this.callback,
    this.deletedCookie = true,
    super.key,
  });

  final String url;
  final WebViewCallback? callback;
  final bool deletedCookie;

  @override
  State<GetCookieWebView> createState() => GetCookieWebViewState();
}

class GetCookieWebViewState extends State<GetCookieWebView> {
  final GlobalKey<WebViewState> webViewState = GlobalKey();

  Future reload() async {
    await webViewState.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      key: webViewState,
      url: widget.url,
      callback: widget.callback,
      deletedCookie: widget.deletedCookie,
    );
  }
}
