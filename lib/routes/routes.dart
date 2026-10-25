import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/gallery/comments_page.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/gallery/gallery_view.dart';
import 'package:eros_n/pages/gallery/thumb_page.dart';
import 'package:eros_n/pages/nav/downloads/downloads_page.dart';
import 'package:eros_n/pages/nav/favorite/favorite_view.dart';
import 'package:eros_n/pages/nav/front/front_view.dart';
import 'package:eros_n/pages/nav/history/history_view.dart';
import 'package:eros_n/pages/nav/index/index_view.dart';
import 'package:eros_n/pages/nav/more/more_view.dart';
import 'package:eros_n/pages/nav/search/search_provider.dart';
import 'package:eros_n/pages/nav/search/search_view.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/pages/setting/about_page.dart';
import 'package:eros_n/pages/setting/advanced_setting_page.dart';
import 'package:eros_n/pages/setting/appearance_setting_page.dart';
import 'package:eros_n/pages/setting/download_setting_page.dart';
import 'package:eros_n/pages/setting/general_setting_page.dart';
import 'package:eros_n/pages/setting/item_width_setting_page.dart';
import 'package:eros_n/pages/setting/license_page.dart';
import 'package:eros_n/pages/setting/read_setting_page.dart';
import 'package:eros_n/pages/setting/settings_page.dart';
import 'package:eros_n/pages/setting/translation_setting_page.dart';
import 'package:eros_n/pages/splash/splash_view.dart';
import 'package:eros_n/pages/user/login_page.dart';
import 'package:eros_n/pages/user/web_login_page.dart';
import 'package:eros_n/pages/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'routes.g.dart';

class NHRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String front = '/front';
  static const String favorite = '/favorite';
  static const String history = '/history';
  static const String gallery = '/gallery';
  static const String read = '/read';
  static const String settings = '/settings';
  static const String appearanceSetting = '/appearanceSetting';
  static const String readSetting = '/readSetting';
  static const String advancedSetting = '/advancedSetting';
  static const String generalSetting = '/generalSetting';
  static const String login = '/login';
  static const String webLogin = '/webLogin';
  static const String webView = '/webView';
  static const String about = '/about';
  static const String license = '/license';
  static const String thumb = '/thumb';
  static const String comments = '/comments';
  static const String search = '/search';
  static const String more = '/more';
  static const String itemWidthSetting = '/itemWidthSetting';
  static const String downloads = '/downloads';
  static const String downloadSetting = '/download-setting';
  static const String translationSetting = '/translationSetting';
}

class AppRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

final GoRouter erosRouter = GoRouter(
  routes: $appRoutes,
  observers: [AppRouteObserver(), FlutterSmartDialog.observer],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('route error: ${state.uri}')),
  ),
);

// ---------------------------------------------------------------------------
// Typed routes (go_router_builder)
// ---------------------------------------------------------------------------

@TypedGoRoute<SplashRoute>(path: NHRoutes.root)
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<IndexRoute>(path: NHRoutes.home)
class IndexRoute extends GoRouteData with $IndexRoute {
  const IndexRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const IndexPage();
}

@TypedGoRoute<FrontRoute>(path: NHRoutes.front)
class FrontRoute extends GoRouteData with $FrontRoute {
  const FrontRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FrontPage();
}

@TypedGoRoute<FavoriteRoute>(path: NHRoutes.favorite)
class FavoriteRoute extends GoRouteData with $FavoriteRoute {
  const FavoriteRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FavoritePage();
}

@TypedGoRoute<HistoryRoute>(path: NHRoutes.history)
class HistoryRoute extends GoRouteData with $HistoryRoute {
  const HistoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HistoryPage();
}

@TypedGoRoute<SearchRoute>(path: NHRoutes.search)
class SearchRoute extends GoRouteData with $SearchRoute {
  const SearchRoute({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SearchPage(query: query);
}

@TypedGoRoute<MoreRoute>(path: NHRoutes.more)
class MoreRoute extends GoRouteData with $MoreRoute {
  const MoreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MorePage();
}

@TypedGoRoute<GalleryRoute>(path: '${NHRoutes.gallery}/:gid')
class GalleryRoute extends GoRouteData with $GalleryRoute {
  const GalleryRoute({required this.gid, this.heroTag});

  final int gid;
  final String? heroTag;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GalleryPage(gid: gid, heroTag: heroTag);
}

@TypedGoRoute<ReadRoute>(path: NHRoutes.read)
class ReadRoute extends GoRouteData with $ReadRoute {
  const ReadRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ReadPage();
}

@TypedGoRoute<ThumbRoute>(path: '${NHRoutes.thumb}/:gid')
class ThumbRoute extends GoRouteData with $ThumbRoute {
  const ThumbRoute({required this.gid});

  final int gid;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ThumbPage(gid: gid);
}

@TypedGoRoute<CommentsRoute>(path: '${NHRoutes.comments}/:gid')
class CommentsRoute extends GoRouteData with $CommentsRoute {
  const CommentsRoute({required this.gid});

  final int gid;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CommentsPage(gid: gid);
}

@TypedGoRoute<SettingsRoute>(path: NHRoutes.settings)
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

@TypedGoRoute<AppearanceSettingRoute>(path: NHRoutes.appearanceSetting)
class AppearanceSettingRoute extends GoRouteData with $AppearanceSettingRoute {
  const AppearanceSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppearanceSettingPage();
}

@TypedGoRoute<GeneralSettingRoute>(path: NHRoutes.generalSetting)
class GeneralSettingRoute extends GoRouteData with $GeneralSettingRoute {
  const GeneralSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GeneralSettingPage();
}

@TypedGoRoute<ReadSettingRoute>(path: NHRoutes.readSetting)
class ReadSettingRoute extends GoRouteData with $ReadSettingRoute {
  const ReadSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ReadSettingPage();
}

@TypedGoRoute<AdvancedSettingRoute>(path: NHRoutes.advancedSetting)
class AdvancedSettingRoute extends GoRouteData with $AdvancedSettingRoute {
  const AdvancedSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdvancedSettingPage();
}

@TypedGoRoute<DownloadSettingRoute>(path: NHRoutes.downloadSetting)
class DownloadSettingRoute extends GoRouteData with $DownloadSettingRoute {
  const DownloadSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DownloadSettingPage();
}

@TypedGoRoute<TranslationSettingRoute>(path: NHRoutes.translationSetting)
class TranslationSettingRoute extends GoRouteData with $TranslationSettingRoute {
  const TranslationSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TranslationSettingPage();
}

@TypedGoRoute<ItemWidthSettingRoute>(path: NHRoutes.itemWidthSetting)
class ItemWidthSettingRoute extends GoRouteData with $ItemWidthSettingRoute {
  const ItemWidthSettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ItemWidthSettingPage();
}

@TypedGoRoute<LoginRoute>(path: NHRoutes.login)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<WebLoginRoute>(path: NHRoutes.webLogin)
class WebLoginRoute extends GoRouteData with $WebLoginRoute {
  const WebLoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WebLoginPage();
}

@TypedGoRoute<NhWebViewRoute>(path: NHRoutes.webView)
class NhWebViewRoute extends GoRouteData with $NhWebViewRoute {
  const NhWebViewRoute({required this.initialUrl, this.title});

  final String initialUrl;
  final String? title;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      NhWebViewPage(initialUrl: initialUrl, title: title);
}

@TypedGoRoute<AboutRoute>(path: NHRoutes.about)
class AboutRoute extends GoRouteData with $AboutRoute {
  const AboutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AboutPage();
}

@TypedGoRoute<MyLicenseRoute>(path: NHRoutes.license)
class MyLicenseRoute extends GoRouteData with $MyLicenseRoute {
  const MyLicenseRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyLicensePage();
}

@TypedGoRoute<DownloadsRoute>(path: NHRoutes.downloads)
class DownloadsRoute extends GoRouteData with $DownloadsRoute {
  const DownloadsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DownloadsPage();
}

class RouteUtil {
  static Future<void> goRead(
    BuildContext context,
    WidgetRef ref, {
    int? index,
    String? heroTagPrefix,
  }) async {
    final gid = currentGalleryGid;
    if (index != null) {
      ref.read(galleryProvider(gid).notifier).setInitialPage(index);
    }

    ref.read(thumbHeroTagPrefixProvider.notifier).set(heroTagPrefix ?? '');

    await erosRouter.push<void>(const ReadRoute().location);
  }

  static Future<void> goGallery(
    WidgetRef ref,
    Gallery gallery, {
    String? heroTag,
  }) async {
    // NOTE: must be `watch`, not `read`. `galleryProvider` is autoDispose;
    // a `read` would let the freshly-initialised notifier be disposed before
    // the gallery page mounts and re-watches it, so the init state is lost
    // and the page renders with an empty Gallery.
    ref.watch(galleryProvider(gallery.gid).notifier).initFromGallery(gallery);
    pushGalleryPage(gallery.gid);
    try {
      await erosRouter
          .push<void>(GalleryRoute(gid: gallery.gid, heroTag: heroTag).location);
    } finally {
      popGalleryPage();
    }
  }

  static Future<void> goGalleryByGid(
    WidgetRef ref,
    int gid, {
    String? heroTag,
    bool replace = false,
  }) async {
    // See note above in goGallery: keep `watch` to anchor the autoDispose
    // provider until the gallery page itself starts watching it.
    ref.watch(galleryProvider(gid).notifier).initFromGid(gid);
    pushGalleryPage(gid);
    try {
      final location = GalleryRoute(gid: gid, heroTag: heroTag).location;
      if (replace) {
        await erosRouter.replace<void>(location);
      } else {
        await erosRouter.push<void>(location);
      }
    } finally {
      popGalleryPage();
    }
  }

  static Future<bool> goGalleryByUrl(
    WidgetRef ref,
    String url, {
    bool replace = false,
  }) async {
    final RegExp regGalleryUrl = RegExp(r'https?://nhentai.net/g/(\d+)/?');
    final RegExp regGalleryPageUrl = RegExp(r'https://nhentai.net/g/(\d+)/\d+');

    if (regGalleryUrl.hasMatch(url)) {
      final String gid = regGalleryUrl.firstMatch(url)!.group(1)!;
      await RouteUtil.goGalleryByGid(ref, int.parse(gid), replace: replace);
    } else if (regGalleryPageUrl.hasMatch(url)) {
      final String gid = regGalleryPageUrl.firstMatch(url)!.group(1)!;
      await RouteUtil.goGalleryByGid(ref, int.parse(gid), replace: replace);
    } else {
      return false;
    }
    return true;
  }

  static Future<void> goSearch({Tag? tag, String? keyword}) async {
    String query = (tag?.name ?? '').trim();
    if (query.contains(' ')) {
      query = '"$query"';
    }
    query = '${tag?.type?.toLowerCase()}:$query';

    pushSearchDepth();
    try {
      await erosRouter.push<void>(SearchRoute(query: query).location);
    } finally {
      popSearchDepth();
    }
  }
}
