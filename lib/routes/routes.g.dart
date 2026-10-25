// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $indexRoute,
  $frontRoute,
  $favoriteRoute,
  $historyRoute,
  $searchRoute,
  $moreRoute,
  $galleryRoute,
  $readRoute,
  $thumbRoute,
  $commentsRoute,
  $settingsRoute,
  $appearanceSettingRoute,
  $generalSettingRoute,
  $readSettingRoute,
  $advancedSettingRoute,
  $downloadSettingRoute,
  $translationSettingRoute,
  $itemWidthSettingRoute,
  $loginRoute,
  $webLoginRoute,
  $nhWebViewRoute,
  $aboutRoute,
  $myLicenseRoute,
  $downloadsRoute,
];

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $SplashRoute._fromState,
);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $indexRoute => GoRouteData.$route(
  path: '/home',
  hasOverriddenOnExit: false,
  factory: $IndexRoute._fromState,
);

mixin $IndexRoute on GoRouteData {
  static IndexRoute _fromState(GoRouterState state) => const IndexRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $frontRoute => GoRouteData.$route(
  path: '/front',
  hasOverriddenOnExit: false,
  factory: $FrontRoute._fromState,
);

mixin $FrontRoute on GoRouteData {
  static FrontRoute _fromState(GoRouterState state) => const FrontRoute();

  @override
  String get location => GoRouteData.$location('/front');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $favoriteRoute => GoRouteData.$route(
  path: '/favorite',
  hasOverriddenOnExit: false,
  factory: $FavoriteRoute._fromState,
);

mixin $FavoriteRoute on GoRouteData {
  static FavoriteRoute _fromState(GoRouterState state) => const FavoriteRoute();

  @override
  String get location => GoRouteData.$location('/favorite');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $historyRoute => GoRouteData.$route(
  path: '/history',
  hasOverriddenOnExit: false,
  factory: $HistoryRoute._fromState,
);

mixin $HistoryRoute on GoRouteData {
  static HistoryRoute _fromState(GoRouterState state) => const HistoryRoute();

  @override
  String get location => GoRouteData.$location('/history');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchRoute => GoRouteData.$route(
  path: '/search',
  hasOverriddenOnExit: false,
  factory: $SearchRoute._fromState,
);

mixin $SearchRoute on GoRouteData {
  static SearchRoute _fromState(GoRouterState state) =>
      SearchRoute(query: state.uri.queryParameters['query']!);

  SearchRoute get _self => this as SearchRoute;

  @override
  String get location =>
      GoRouteData.$location('/search', queryParams: {'query': _self.query});

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $moreRoute => GoRouteData.$route(
  path: '/more',
  hasOverriddenOnExit: false,
  factory: $MoreRoute._fromState,
);

mixin $MoreRoute on GoRouteData {
  static MoreRoute _fromState(GoRouterState state) => const MoreRoute();

  @override
  String get location => GoRouteData.$location('/more');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $galleryRoute => GoRouteData.$route(
  path: '/gallery/:gid',
  hasOverriddenOnExit: false,
  factory: $GalleryRoute._fromState,
);

mixin $GalleryRoute on GoRouteData {
  static GalleryRoute _fromState(GoRouterState state) => GalleryRoute(
    gid: int.parse(state.pathParameters['gid']!),
    heroTag: state.uri.queryParameters['hero-tag'],
  );

  GalleryRoute get _self => this as GalleryRoute;

  @override
  String get location => GoRouteData.$location(
    '/gallery/${Uri.encodeComponent(_self.gid.toString())}',
    queryParams: {if (_self.heroTag != null) 'hero-tag': _self.heroTag},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $readRoute => GoRouteData.$route(
  path: '/read',
  hasOverriddenOnExit: false,
  factory: $ReadRoute._fromState,
);

mixin $ReadRoute on GoRouteData {
  static ReadRoute _fromState(GoRouterState state) => const ReadRoute();

  @override
  String get location => GoRouteData.$location('/read');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $thumbRoute => GoRouteData.$route(
  path: '/thumb/:gid',
  hasOverriddenOnExit: false,
  factory: $ThumbRoute._fromState,
);

mixin $ThumbRoute on GoRouteData {
  static ThumbRoute _fromState(GoRouterState state) =>
      ThumbRoute(gid: int.parse(state.pathParameters['gid']!));

  ThumbRoute get _self => this as ThumbRoute;

  @override
  String get location => GoRouteData.$location(
    '/thumb/${Uri.encodeComponent(_self.gid.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $commentsRoute => GoRouteData.$route(
  path: '/comments/:gid',
  hasOverriddenOnExit: false,
  factory: $CommentsRoute._fromState,
);

mixin $CommentsRoute on GoRouteData {
  static CommentsRoute _fromState(GoRouterState state) =>
      CommentsRoute(gid: int.parse(state.pathParameters['gid']!));

  CommentsRoute get _self => this as CommentsRoute;

  @override
  String get location => GoRouteData.$location(
    '/comments/${Uri.encodeComponent(_self.gid.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
  path: '/settings',
  hasOverriddenOnExit: false,
  factory: $SettingsRoute._fromState,
);

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $appearanceSettingRoute => GoRouteData.$route(
  path: '/appearanceSetting',
  hasOverriddenOnExit: false,
  factory: $AppearanceSettingRoute._fromState,
);

mixin $AppearanceSettingRoute on GoRouteData {
  static AppearanceSettingRoute _fromState(GoRouterState state) =>
      const AppearanceSettingRoute();

  @override
  String get location => GoRouteData.$location('/appearanceSetting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $generalSettingRoute => GoRouteData.$route(
  path: '/generalSetting',
  hasOverriddenOnExit: false,
  factory: $GeneralSettingRoute._fromState,
);

mixin $GeneralSettingRoute on GoRouteData {
  static GeneralSettingRoute _fromState(GoRouterState state) =>
      const GeneralSettingRoute();

  @override
  String get location => GoRouteData.$location('/generalSetting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $readSettingRoute => GoRouteData.$route(
  path: '/readSetting',
  hasOverriddenOnExit: false,
  factory: $ReadSettingRoute._fromState,
);

mixin $ReadSettingRoute on GoRouteData {
  static ReadSettingRoute _fromState(GoRouterState state) =>
      const ReadSettingRoute();

  @override
  String get location => GoRouteData.$location('/readSetting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $advancedSettingRoute => GoRouteData.$route(
  path: '/advancedSetting',
  hasOverriddenOnExit: false,
  factory: $AdvancedSettingRoute._fromState,
);

mixin $AdvancedSettingRoute on GoRouteData {
  static AdvancedSettingRoute _fromState(GoRouterState state) =>
      const AdvancedSettingRoute();

  @override
  String get location => GoRouteData.$location('/advancedSetting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $downloadSettingRoute => GoRouteData.$route(
  path: '/download-setting',
  hasOverriddenOnExit: false,
  factory: $DownloadSettingRoute._fromState,
);

mixin $DownloadSettingRoute on GoRouteData {
  static DownloadSettingRoute _fromState(GoRouterState state) =>
      const DownloadSettingRoute();

  @override
  String get location => GoRouteData.$location('/download-setting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $translationSettingRoute => GoRouteData.$route(
  path: '/translationSetting',
  hasOverriddenOnExit: false,
  factory: $TranslationSettingRoute._fromState,
);

mixin $TranslationSettingRoute on GoRouteData {
  static TranslationSettingRoute _fromState(GoRouterState state) =>
      const TranslationSettingRoute();

  @override
  String get location => GoRouteData.$location('/translationSetting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $itemWidthSettingRoute => GoRouteData.$route(
  path: '/itemWidthSetting',
  hasOverriddenOnExit: false,
  factory: $ItemWidthSettingRoute._fromState,
);

mixin $ItemWidthSettingRoute on GoRouteData {
  static ItemWidthSettingRoute _fromState(GoRouterState state) =>
      const ItemWidthSettingRoute();

  @override
  String get location => GoRouteData.$location('/itemWidthSetting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $webLoginRoute => GoRouteData.$route(
  path: '/webLogin',
  hasOverriddenOnExit: false,
  factory: $WebLoginRoute._fromState,
);

mixin $WebLoginRoute on GoRouteData {
  static WebLoginRoute _fromState(GoRouterState state) => const WebLoginRoute();

  @override
  String get location => GoRouteData.$location('/webLogin');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nhWebViewRoute => GoRouteData.$route(
  path: '/webView',
  hasOverriddenOnExit: false,
  factory: $NhWebViewRoute._fromState,
);

mixin $NhWebViewRoute on GoRouteData {
  static NhWebViewRoute _fromState(GoRouterState state) => NhWebViewRoute(
    initialUrl: state.uri.queryParameters['initial-url']!,
    title: state.uri.queryParameters['title'],
  );

  NhWebViewRoute get _self => this as NhWebViewRoute;

  @override
  String get location => GoRouteData.$location(
    '/webView',
    queryParams: {
      'initial-url': _self.initialUrl,
      if (_self.title != null) 'title': _self.title,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $aboutRoute => GoRouteData.$route(
  path: '/about',
  hasOverriddenOnExit: false,
  factory: $AboutRoute._fromState,
);

mixin $AboutRoute on GoRouteData {
  static AboutRoute _fromState(GoRouterState state) => const AboutRoute();

  @override
  String get location => GoRouteData.$location('/about');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $myLicenseRoute => GoRouteData.$route(
  path: '/license',
  hasOverriddenOnExit: false,
  factory: $MyLicenseRoute._fromState,
);

mixin $MyLicenseRoute on GoRouteData {
  static MyLicenseRoute _fromState(GoRouterState state) =>
      const MyLicenseRoute();

  @override
  String get location => GoRouteData.$location('/license');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $downloadsRoute => GoRouteData.$route(
  path: '/downloads',
  hasOverriddenOnExit: false,
  factory: $DownloadsRoute._fromState,
);

mixin $DownloadsRoute on GoRouteData {
  static DownloadsRoute _fromState(GoRouterState state) =>
      const DownloadsRoute();

  @override
  String get location => GoRouteData.$location('/downloads');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
