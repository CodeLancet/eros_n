import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_all/webview_all.dart';

class NhWebViewPage extends ConsumerStatefulWidget {
  const NhWebViewPage({super.key, required this.initialUrl, this.title});
  final String initialUrl;
  final String? title;

  @override
  ConsumerState<NhWebViewPage> createState() => _NhWebViewPageState();
}

class _NhWebViewPageState extends ConsumerState<NhWebViewPage> {
  final WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  Future<void> _initWebView() async {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(NHConst.userAgent)
      ..setBackgroundColor(Colors.transparent);
    await _controller.loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(widget.title ?? ''),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
