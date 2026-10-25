import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
  ];

  /// No description provided for @language_name.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_name;

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Eros-N'**
  String get app_title;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get newest;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login_by_web.
  ///
  /// In en, this message translates to:
  /// **'Login by Web'**
  String get login_by_web;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @thumbs.
  ///
  /// In en, this message translates to:
  /// **'Thumbs'**
  String get thumbs;

  /// No description provided for @more_like_this.
  ///
  /// In en, this message translates to:
  /// **'More like this'**
  String get more_like_this;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @please_login_first.
  ///
  /// In en, this message translates to:
  /// **'Please login first'**
  String get please_login_first;

  /// No description provided for @login_need_captcha.
  ///
  /// In en, this message translates to:
  /// **'Login need captcha'**
  String get login_need_captcha;

  /// No description provided for @login_invalid.
  ///
  /// In en, this message translates to:
  /// **'Login invalid'**
  String get login_invalid;

  /// No description provided for @please_login_web.
  ///
  /// In en, this message translates to:
  /// **'Please login with web'**
  String get please_login_web;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// No description provided for @always.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get always;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @tag_type_parodies.
  ///
  /// In en, this message translates to:
  /// **'Parodies'**
  String get tag_type_parodies;

  /// No description provided for @tag_type_characters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get tag_type_characters;

  /// No description provided for @tag_type_tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tag_type_tags;

  /// No description provided for @tag_type_artists.
  ///
  /// In en, this message translates to:
  /// **'Artists'**
  String get tag_type_artists;

  /// No description provided for @tag_type_groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get tag_type_groups;

  /// No description provided for @tag_type_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get tag_type_languages;

  /// No description provided for @tag_type_categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get tag_type_categories;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @popular_today.
  ///
  /// In en, this message translates to:
  /// **'Popular Today'**
  String get popular_today;

  /// No description provided for @popular_week.
  ///
  /// In en, this message translates to:
  /// **'Popular Week'**
  String get popular_week;

  /// No description provided for @popular_month.
  ///
  /// In en, this message translates to:
  /// **'Popular Month'**
  String get popular_month;

  /// No description provided for @popular_all.
  ///
  /// In en, this message translates to:
  /// **'Popular All'**
  String get popular_all;

  /// No description provided for @clear_history.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clear_history;

  /// No description provided for @clear_history_tip.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to clear all history?'**
  String get clear_history_tip;

  /// No description provided for @recent_searches.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get recent_searches;

  /// No description provided for @clear_search_history_tip.
  ///
  /// In en, this message translates to:
  /// **'Clear all search history?'**
  String get clear_search_history_tip;

  /// No description provided for @left_to_right.
  ///
  /// In en, this message translates to:
  /// **'Left to Right'**
  String get left_to_right;

  /// No description provided for @right_to_left.
  ///
  /// In en, this message translates to:
  /// **'Right to Left'**
  String get right_to_left;

  /// No description provided for @webtoon.
  ///
  /// In en, this message translates to:
  /// **'Webtoon'**
  String get webtoon;

  /// No description provided for @vertical.
  ///
  /// In en, this message translates to:
  /// **'Vertical'**
  String get vertical;

  /// No description provided for @curl_vertical.
  ///
  /// In en, this message translates to:
  /// **'Curl Vertical'**
  String get curl_vertical;

  /// No description provided for @full_screen.
  ///
  /// In en, this message translates to:
  /// **'Full Screen'**
  String get full_screen;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @theme_mode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get theme_mode;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @dynamic_color.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Color'**
  String get dynamic_color;

  /// No description provided for @dynamic_color_tip.
  ///
  /// In en, this message translates to:
  /// **'Color will change according to the wallpaper'**
  String get dynamic_color_tip;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @list_style.
  ///
  /// In en, this message translates to:
  /// **'List Style'**
  String get list_style;

  /// No description provided for @tag_translation.
  ///
  /// In en, this message translates to:
  /// **'Tag Translation'**
  String get tag_translation;

  /// No description provided for @tag_translation_tip.
  ///
  /// In en, this message translates to:
  /// **'need download tag translation data, version: {version}'**
  String tag_translation_tip(Object version);

  /// No description provided for @tag_translation_updating.
  ///
  /// In en, this message translates to:
  /// **'Downloading translation data...'**
  String get tag_translation_updating;

  /// No description provided for @tag_translation_updated.
  ///
  /// In en, this message translates to:
  /// **'Translation data updated'**
  String get tag_translation_updated;

  /// No description provided for @tag_translation_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Translation data update failed'**
  String get tag_translation_update_failed;

  /// No description provided for @tags_data.
  ///
  /// In en, this message translates to:
  /// **'Tags Data'**
  String get tags_data;

  /// No description provided for @show_tags.
  ///
  /// In en, this message translates to:
  /// **'Show Tags'**
  String get show_tags;

  /// No description provided for @show_tags_tip.
  ///
  /// In en, this message translates to:
  /// **'Show tags in list, need download tags data'**
  String get show_tags_tip;

  /// No description provided for @tag_layout_on_item.
  ///
  /// In en, this message translates to:
  /// **'Tag Layout on Item'**
  String get tag_layout_on_item;

  /// No description provided for @wrap.
  ///
  /// In en, this message translates to:
  /// **'Wrap'**
  String get wrap;

  /// No description provided for @single_line.
  ///
  /// In en, this message translates to:
  /// **'Single Line'**
  String get single_line;

  /// No description provided for @cover_blur.
  ///
  /// In en, this message translates to:
  /// **'Cover Blur'**
  String get cover_blur;

  /// No description provided for @list_model.
  ///
  /// In en, this message translates to:
  /// **'List Model'**
  String get list_model;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// No description provided for @grid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get grid;

  /// No description provided for @waterfall.
  ///
  /// In en, this message translates to:
  /// **'Waterfall Flow'**
  String get waterfall;

  /// No description provided for @waterfall_compact.
  ///
  /// In en, this message translates to:
  /// **'Waterfall Flow (Compact)'**
  String get waterfall_compact;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @tag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get tag;

  /// No description provided for @read_model.
  ///
  /// In en, this message translates to:
  /// **'Read Model'**
  String get read_model;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @hide_bottom_navigation_on_scroll.
  ///
  /// In en, this message translates to:
  /// **'Hide Bottom Navigation on Scroll'**
  String get hide_bottom_navigation_on_scroll;

  /// No description provided for @use_gallery_tint.
  ///
  /// In en, this message translates to:
  /// **'Use Gallery Tint'**
  String get use_gallery_tint;

  /// No description provided for @use_gallery_tint_tip.
  ///
  /// In en, this message translates to:
  /// **'Tint gallery pages base on the color of the cover'**
  String get use_gallery_tint_tip;

  /// No description provided for @comment_length_error.
  ///
  /// In en, this message translates to:
  /// **'Comment must be longer than 10 characters'**
  String get comment_length_error;

  /// No description provided for @open_supported_links.
  ///
  /// In en, this message translates to:
  /// **'Open supported links'**
  String get open_supported_links;

  /// No description provided for @open_supported_links_tip.
  ///
  /// In en, this message translates to:
  /// **'Starting with Android 12, apps can only be used as web link handling apps if they are approved. Otherwise it will be processed using the default browser. You can manually approve it here'**
  String get open_supported_links_tip;

  /// No description provided for @volume_key_turn_page.
  ///
  /// In en, this message translates to:
  /// **'Volume key to turn page'**
  String get volume_key_turn_page;

  /// No description provided for @auto_read_interval.
  ///
  /// In en, this message translates to:
  /// **'Auto read interval'**
  String get auto_read_interval;

  /// No description provided for @preload_pages_count.
  ///
  /// In en, this message translates to:
  /// **'Preload pages count'**
  String get preload_pages_count;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @translated.
  ///
  /// In en, this message translates to:
  /// **'Translated'**
  String get translated;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @clipboard_detection.
  ///
  /// In en, this message translates to:
  /// **'Clipboard link detection'**
  String get clipboard_detection;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @author.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @custom_layout_width.
  ///
  /// In en, this message translates to:
  /// **'Custom Layout Width'**
  String get custom_layout_width;

  /// No description provided for @show_less.
  ///
  /// In en, this message translates to:
  /// **'Showing less'**
  String get show_less;

  /// No description provided for @show_more.
  ///
  /// In en, this message translates to:
  /// **'Showing more'**
  String get show_more;

  /// No description provided for @pinch_to_zoom_hint.
  ///
  /// In en, this message translates to:
  /// **'You can also pinch to adjust on the page'**
  String get pinch_to_zoom_hint;

  /// No description provided for @liquid_glass.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass'**
  String get liquid_glass;

  /// No description provided for @download_management.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get download_management;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// No description provided for @download_paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get download_paused;

  /// No description provided for @download_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get download_completed;

  /// No description provided for @download_failed.
  ///
  /// In en, this message translates to:
  /// **'Download Failed'**
  String get download_failed;

  /// No description provided for @download_redownload.
  ///
  /// In en, this message translates to:
  /// **'Re-download'**
  String get download_redownload;

  /// No description provided for @download_delete_confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Download'**
  String get download_delete_confirm_title;

  /// No description provided for @download_delete_confirm_message.
  ///
  /// In en, this message translates to:
  /// **'This will delete the task record and all downloaded files. Continue?'**
  String get download_delete_confirm_message;

  /// No description provided for @no_downloads.
  ///
  /// In en, this message translates to:
  /// **'No Downloads'**
  String get no_downloads;

  /// No description provided for @no_result.
  ///
  /// In en, this message translates to:
  /// **'No Results'**
  String get no_result;

  /// No description provided for @download_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get download_pending;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @download_total_pages.
  ///
  /// In en, this message translates to:
  /// **'{count} pages'**
  String download_total_pages(Object count);

  /// No description provided for @download_progress.
  ///
  /// In en, this message translates to:
  /// **'{downloaded} / {total} pages'**
  String download_progress(Object downloaded, Object total);

  /// No description provided for @favorite_added.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get favorite_added;

  /// No description provided for @favorite_removed.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get favorite_removed;

  /// No description provided for @favorite_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update favorite: {error}'**
  String favorite_failed(Object error);

  /// No description provided for @sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sort_by;

  /// No description provided for @sort_date_newest.
  ///
  /// In en, this message translates to:
  /// **'Date (Newest)'**
  String get sort_date_newest;

  /// No description provided for @sort_date_oldest.
  ///
  /// In en, this message translates to:
  /// **'Date (Oldest)'**
  String get sort_date_oldest;

  /// No description provided for @sort_title_az.
  ///
  /// In en, this message translates to:
  /// **'Title (A–Z)'**
  String get sort_title_az;

  /// No description provided for @sort_title_za.
  ///
  /// In en, this message translates to:
  /// **'Title (Z–A)'**
  String get sort_title_za;

  /// No description provided for @added_on.
  ///
  /// In en, this message translates to:
  /// **'Added {date}'**
  String added_on(Object date);

  /// No description provided for @download_settings.
  ///
  /// In en, this message translates to:
  /// **'Download Settings'**
  String get download_settings;

  /// No description provided for @concurrent_downloads.
  ///
  /// In en, this message translates to:
  /// **'Concurrent Downloads'**
  String get concurrent_downloads;

  /// No description provided for @max_concurrent_galleries.
  ///
  /// In en, this message translates to:
  /// **'Simultaneous galleries'**
  String get max_concurrent_galleries;

  /// No description provided for @max_concurrent_pages.
  ///
  /// In en, this message translates to:
  /// **'Pages per gallery'**
  String get max_concurrent_pages;

  /// No description provided for @download_path.
  ///
  /// In en, this message translates to:
  /// **'Download Path'**
  String get download_path;

  /// No description provided for @current_path.
  ///
  /// In en, this message translates to:
  /// **'Current path'**
  String get current_path;

  /// No description provided for @reset_to_default.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get reset_to_default;

  /// No description provided for @cdn_warn_moderate.
  ///
  /// In en, this message translates to:
  /// **'Total concurrent requests: {total} ({galleries} × {pages}). This may trigger CDN rate limiting during bulk downloads. Reduce concurrency if downloads fail.'**
  String cdn_warn_moderate(Object total, Object galleries, Object pages);

  /// No description provided for @clear_cache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clear_cache;

  /// No description provided for @clear_cache_tip.
  ///
  /// In en, this message translates to:
  /// **'Clear all cached data? (HTTP responses, images)'**
  String get clear_cache_tip;

  /// No description provided for @cache_calculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get cache_calculating;

  /// No description provided for @open_in_browser.
  ///
  /// In en, this message translates to:
  /// **'Open in Browser'**
  String get open_in_browser;

  /// No description provided for @cdn_warn_high.
  ///
  /// In en, this message translates to:
  /// **'Total concurrent requests: {total} ({galleries} × {pages}). Very likely to trigger a temporary CDN ban, causing download failures and broken thumbnails. Reduce concurrency.'**
  String cdn_warn_high(Object total, Object galleries, Object pages);

  /// No description provided for @double_back_to_exit.
  ///
  /// In en, this message translates to:
  /// **'Double back to exit'**
  String get double_back_to_exit;

  /// No description provided for @press_back_again_to_exit.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get press_back_again_to_exit;

  /// No description provided for @comment_translation.
  ///
  /// In en, this message translates to:
  /// **'Comment Translation'**
  String get comment_translation;

  /// No description provided for @translation_service_config.
  ///
  /// In en, this message translates to:
  /// **'Translation Service'**
  String get translation_service_config;

  /// No description provided for @translation_api_url.
  ///
  /// In en, this message translates to:
  /// **'API URL'**
  String get translation_api_url;

  /// No description provided for @translation_api_key.
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get translation_api_key;

  /// No description provided for @translation_model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get translation_model;

  /// No description provided for @translation_hint.
  ///
  /// In en, this message translates to:
  /// **'Uses built-in translation service or free Google Translate when not configured'**
  String get translation_hint;

  /// No description provided for @translating.
  ///
  /// In en, this message translates to:
  /// **'Translating...'**
  String get translating;

  /// No description provided for @translation_failed.
  ///
  /// In en, this message translates to:
  /// **'Translation failed'**
  String get translation_failed;

  /// No description provided for @translation_provider.
  ///
  /// In en, this message translates to:
  /// **'Translation Provider'**
  String get translation_provider;

  /// No description provided for @fetch_models.
  ///
  /// In en, this message translates to:
  /// **'Fetch Models'**
  String get fetch_models;

  /// No description provided for @fetch_models_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch models'**
  String get fetch_models_failed;

  /// No description provided for @manual_input.
  ///
  /// In en, this message translates to:
  /// **'Manual Input'**
  String get manual_input;

  /// No description provided for @auto_translate_comments.
  ///
  /// In en, this message translates to:
  /// **'Auto translate comments'**
  String get auto_translate_comments;

  /// No description provided for @translation_settings.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation_settings;

  /// No description provided for @translation_display_mode.
  ///
  /// In en, this message translates to:
  /// **'Translation Display'**
  String get translation_display_mode;

  /// No description provided for @replace_original.
  ///
  /// In en, this message translates to:
  /// **'Replace Original'**
  String get replace_original;

  /// No description provided for @bilingual_display.
  ///
  /// In en, this message translates to:
  /// **'Bilingual'**
  String get bilingual_display;

  /// No description provided for @bilingual_style.
  ///
  /// In en, this message translates to:
  /// **'Bilingual Style'**
  String get bilingual_style;

  /// No description provided for @bilingual_style_divider.
  ///
  /// In en, this message translates to:
  /// **'Divider'**
  String get bilingual_style_divider;

  /// No description provided for @bilingual_style_subtle.
  ///
  /// In en, this message translates to:
  /// **'Subtle Italic'**
  String get bilingual_style_subtle;

  /// No description provided for @bilingual_style_compact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get bilingual_style_compact;

  /// No description provided for @use_google_translate.
  ///
  /// In en, this message translates to:
  /// **'Use Google Translate'**
  String get use_google_translate;

  /// No description provided for @use_google_translate_tip.
  ///
  /// In en, this message translates to:
  /// **'Skip LLM and use free Google Translate directly'**
  String get use_google_translate_tip;

  /// No description provided for @clear_translation_cache.
  ///
  /// In en, this message translates to:
  /// **'Clear Translation Cache'**
  String get clear_translation_cache;

  /// No description provided for @clear_translation_cache_tip.
  ///
  /// In en, this message translates to:
  /// **'Clear all cached translations?'**
  String get clear_translation_cache_tip;

  /// No description provided for @translation_cache_entries.
  ///
  /// In en, this message translates to:
  /// **'{count} cached translations'**
  String translation_cache_entries(Object count);

  /// No description provided for @translation_cache_cleared.
  ///
  /// In en, this message translates to:
  /// **'Translation cache cleared'**
  String get translation_cache_cleared;

  /// No description provided for @custom_provider.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom_provider;

  /// No description provided for @security_challenge.
  ///
  /// In en, this message translates to:
  /// **'Security Challenge'**
  String get security_challenge;

  /// No description provided for @logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to logout?'**
  String get logout_confirm;

  /// No description provided for @cover_blur_tip.
  ///
  /// In en, this message translates to:
  /// **'Blur cover image in list'**
  String get cover_blur_tip;

  /// No description provided for @load_more_fail.
  ///
  /// In en, this message translates to:
  /// **'Load more fail'**
  String get load_more_fail;

  /// No description provided for @bilingual_preview_original.
  ///
  /// In en, this message translates to:
  /// **'This is the original comment text.'**
  String get bilingual_preview_original;

  /// No description provided for @bilingual_preview_translated.
  ///
  /// In en, this message translates to:
  /// **'This is the translated comment text.'**
  String get bilingual_preview_translated;

  /// No description provided for @webview_permission_title.
  ///
  /// In en, this message translates to:
  /// **'WebView permission requested'**
  String get webview_permission_title;

  /// No description provided for @webview_permission_content.
  ///
  /// In en, this message translates to:
  /// **'WebView has requested permission \'\'{kind}\'\''**
  String webview_permission_content(Object kind);

  /// No description provided for @deny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get deny;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @not_initialized.
  ///
  /// In en, this message translates to:
  /// **'Not Initialized'**
  String get not_initialized;

  /// No description provided for @session_expired.
  ///
  /// In en, this message translates to:
  /// **'Session expired, please re-login'**
  String get session_expired;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'ja',
    'ko',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
