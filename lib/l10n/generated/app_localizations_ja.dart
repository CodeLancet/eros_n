// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get language_name => '日本語';

  @override
  String get app_title => 'Eros-N';

  @override
  String get popular => '人気';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get newest => '新着';

  @override
  String get home => 'ホーム';

  @override
  String get favorites => 'お気に入り';

  @override
  String get history => '履歴';

  @override
  String get more => 'その他';

  @override
  String get search => '検索';

  @override
  String get settings => '設定';

  @override
  String get appearance => '外観';

  @override
  String get about => 'アプリについて';

  @override
  String get download => 'ダウンロード';

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get register => '登録';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get login_by_web => 'Webでログイン';

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String get thumbs => 'サムネイル';

  @override
  String get more_like_this => '類似作品';

  @override
  String get read => '読む';

  @override
  String get resume => '続きから';

  @override
  String get share => '共有';

  @override
  String get please_login_first => '先にログインしてください';

  @override
  String get login_need_captcha => 'ログインにはCAPTCHAが必要です';

  @override
  String get login_invalid => 'ログイン情報が無効です';

  @override
  String get please_login_web => 'Webからログインしてください';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get never => 'しない';

  @override
  String get always => '常に';

  @override
  String get auto => '自動';

  @override
  String get comments => 'コメント';

  @override
  String get tag_type_parodies => 'パロディ';

  @override
  String get tag_type_characters => 'キャラクター';

  @override
  String get tag_type_tags => 'タグ';

  @override
  String get tag_type_artists => '作者';

  @override
  String get tag_type_groups => 'グループ';

  @override
  String get tag_type_languages => '言語';

  @override
  String get tag_type_categories => 'カテゴリ';

  @override
  String get recent => '最近';

  @override
  String get popular_today => '今日の人気';

  @override
  String get popular_week => '今週の人気';

  @override
  String get popular_month => '今月の人気';

  @override
  String get popular_all => '全期間の人気';

  @override
  String get clear_history => '履歴を削除';

  @override
  String get clear_history_tip => 'すべての履歴を削除してもよろしいですか？';

  @override
  String get recent_searches => '最近の検索';

  @override
  String get clear_search_history_tip => 'すべての検索履歴を削除しますか？';

  @override
  String get left_to_right => '左から右';

  @override
  String get right_to_left => '右から左';

  @override
  String get webtoon => 'ウェブトゥーン';

  @override
  String get vertical => '縦スクロール';

  @override
  String get curl_vertical => 'めくり（縦）';

  @override
  String get full_screen => 'フルスクリーン';

  @override
  String get display => '表示';

  @override
  String get theme_mode => 'テーマモード';

  @override
  String get light => 'ライト';

  @override
  String get dark => 'ダーク';

  @override
  String get system => 'システム';

  @override
  String get dynamic_color => 'ダイナミックカラー';

  @override
  String get dynamic_color_tip => '壁紙に応じて色が変わります';

  @override
  String get theme => 'テーマ';

  @override
  String get list_style => 'リストスタイル';

  @override
  String get tag_translation => 'タグ翻訳';

  @override
  String tag_translation_tip(Object version) {
    return 'タグ翻訳データのダウンロードが必要です。バージョン: $version';
  }

  @override
  String get tag_translation_updating => '翻訳データをダウンロード中…';

  @override
  String get tag_translation_updated => '翻訳データが更新されました';

  @override
  String get tag_translation_update_failed => '翻訳データの更新に失敗しました';

  @override
  String get tags_data => 'タグデータ';

  @override
  String get show_tags => 'タグを表示';

  @override
  String get show_tags_tip => 'リストにタグを表示します（タグデータのダウンロードが必要）';

  @override
  String get tag_layout_on_item => 'アイテム上のタグレイアウト';

  @override
  String get wrap => '折り返し';

  @override
  String get single_line => '一行表示';

  @override
  String get cover_blur => 'カバーぼかし';

  @override
  String get list_model => 'リストモード';

  @override
  String get list => 'リスト';

  @override
  String get grid => 'グリッド';

  @override
  String get waterfall => 'ウォーターフォール';

  @override
  String get waterfall_compact => 'ウォーターフォール（コンパクト）';

  @override
  String get advanced => '詳細設定';

  @override
  String get tag => 'タグ';

  @override
  String get read_model => '閲覧モード';

  @override
  String get general => '一般';

  @override
  String get language => '言語';

  @override
  String get hide_bottom_navigation_on_scroll => 'スクロール時にナビゲーションバーを隠す';

  @override
  String get use_gallery_tint => 'ギャラリーの色合いを使用';

  @override
  String get use_gallery_tint_tip => 'カバー画像の色に基づいてギャラリーページを着色します';

  @override
  String get comment_length_error => 'コメントは10文字以上でなければなりません';

  @override
  String get open_supported_links => '対応リンクを開く';

  @override
  String get open_supported_links_tip =>
      'Android 12以降、アプリが承認されていない場合、ウェブリンクはデフォルトのブラウザで処理されます。ここで手動で承認できます';

  @override
  String get volume_key_turn_page => '音量キーでページめくり';

  @override
  String get auto_read_interval => '自動閲覧の間隔';

  @override
  String get preload_pages_count => '先読みページ数';

  @override
  String get japanese => '日本語';

  @override
  String get chinese => '中国語';

  @override
  String get english => '英語';

  @override
  String get translated => '翻訳済み';

  @override
  String get none => 'なし';

  @override
  String get all => 'すべて';

  @override
  String get clipboard_detection => 'クリップボードのリンク検出';

  @override
  String get version => 'バージョン';

  @override
  String get author => '作者';

  @override
  String get license => 'ライセンス';

  @override
  String get custom_layout_width => 'カスタムレイアウト幅';

  @override
  String get show_less => '少なく表示';

  @override
  String get show_more => 'もっと表示';

  @override
  String get pinch_to_zoom_hint => 'ページ上でピンチ操作でも調整できます';

  @override
  String get liquid_glass => 'リキッドグラス';

  @override
  String get download_management => 'ダウンロード管理';

  @override
  String get downloading => 'ダウンロード中';

  @override
  String get download_paused => '一時停止';

  @override
  String get download_completed => '完了';

  @override
  String get download_failed => 'ダウンロード失敗';

  @override
  String get download_redownload => '再ダウンロード';

  @override
  String get download_delete_confirm_title => 'ダウンロードを削除';

  @override
  String get download_delete_confirm_message =>
      'タスク記録とダウンロード済みファイルがすべて削除されます。続行しますか？';

  @override
  String get no_downloads => 'ダウンロードなし';

  @override
  String get no_result => '結果なし';

  @override
  String get download_pending => '待機中';

  @override
  String get delete => '削除';

  @override
  String download_total_pages(Object count) {
    return '$countページ';
  }

  @override
  String download_progress(Object downloaded, Object total) {
    return '$downloaded / $totalページ';
  }

  @override
  String get favorite_added => 'お気に入りに追加しました';

  @override
  String get favorite_removed => 'お気に入りから削除しました';

  @override
  String favorite_failed(Object error) {
    return 'お気に入りの更新に失敗しました: $error';
  }

  @override
  String get sort_by => '並び替え';

  @override
  String get sort_date_newest => '日付（新しい順）';

  @override
  String get sort_date_oldest => '日付（古い順）';

  @override
  String get sort_title_az => 'タイトル（A–Z）';

  @override
  String get sort_title_za => 'タイトル（Z–A）';

  @override
  String added_on(Object date) {
    return '$dateに追加';
  }

  @override
  String get download_settings => 'ダウンロード設定';

  @override
  String get concurrent_downloads => '同時ダウンロード数';

  @override
  String get max_concurrent_galleries => '同時ギャラリー数';

  @override
  String get max_concurrent_pages => 'ギャラリーあたりのページ数';

  @override
  String get download_path => 'ダウンロード先';

  @override
  String get current_path => '現在のパス';

  @override
  String get reset_to_default => 'デフォルトに戻す';

  @override
  String cdn_warn_moderate(Object total, Object galleries, Object pages) {
    return '同時リクエスト数: $total（$galleries × $pages）。一括ダウンロード時にCDNのレート制限が発生する可能性があります。ダウンロードに失敗する場合は同時接続数を減らしてください。';
  }

  @override
  String get clear_cache => 'キャッシュを削除';

  @override
  String get clear_cache_tip => 'すべてのキャッシュデータを削除しますか？（HTTPレスポンス、画像）';

  @override
  String get cache_calculating => '計算中…';

  @override
  String get open_in_browser => 'ブラウザで開く';

  @override
  String cdn_warn_high(Object total, Object galleries, Object pages) {
    return '同時リクエスト数: $total（$galleries × $pages）。CDNの一時的なアクセス禁止が発生する可能性が非常に高く、ダウンロードの失敗やサムネイルの表示不具合につながります。同時接続数を減らしてください。';
  }

  @override
  String get double_back_to_exit => 'もう一度戻るで終了';

  @override
  String get press_back_again_to_exit => 'もう一度戻るボタンを押して終了';

  @override
  String get comment_translation => 'コメント翻訳';

  @override
  String get translation_service_config => '翻訳サービス';

  @override
  String get translation_api_url => 'API URL';

  @override
  String get translation_api_key => 'APIキー';

  @override
  String get translation_model => 'モデル';

  @override
  String get translation_hint => '未設定の場合は内蔵の翻訳サービスまたは無料のGoogle翻訳を使用します';

  @override
  String get translating => '翻訳中…';

  @override
  String get translation_failed => '翻訳に失敗しました';

  @override
  String get translation_provider => '翻訳プロバイダー';

  @override
  String get fetch_models => 'モデルを取得';

  @override
  String get fetch_models_failed => 'モデルの取得に失敗しました';

  @override
  String get manual_input => '手動入力';

  @override
  String get auto_translate_comments => 'コメントを自動翻訳';

  @override
  String get translation_settings => '翻訳';

  @override
  String get translation_display_mode => '翻訳の表示方法';

  @override
  String get replace_original => '原文を置換';

  @override
  String get bilingual_display => '二言語表示';

  @override
  String get bilingual_style => '二言語スタイル';

  @override
  String get bilingual_style_divider => '区切り線';

  @override
  String get bilingual_style_subtle => '控えめイタリック';

  @override
  String get bilingual_style_compact => 'コンパクト';

  @override
  String get use_google_translate => 'Google翻訳を使用';

  @override
  String get use_google_translate_tip => 'LLMをスキップして無料のGoogle翻訳を直接使用します';

  @override
  String get clear_translation_cache => '翻訳キャッシュを削除';

  @override
  String get clear_translation_cache_tip => 'すべての翻訳キャッシュを削除しますか？';

  @override
  String translation_cache_entries(Object count) {
    return '$count件の翻訳がキャッシュされています';
  }

  @override
  String get translation_cache_cleared => '翻訳キャッシュを削除しました';

  @override
  String get custom_provider => 'カスタム';

  @override
  String get security_challenge => 'セキュリティチャレンジ';

  @override
  String get logout_confirm => 'ログアウトしてもよろしいですか？';

  @override
  String get cover_blur_tip => 'リストのカバー画像をぼかす';

  @override
  String get load_more_fail => '読み込みに失敗しました';

  @override
  String get bilingual_preview_original => 'This is the original comment text.';

  @override
  String get bilingual_preview_translated => 'これは翻訳されたコメントテキストです。';

  @override
  String get webview_permission_title => 'WebViewの権限リクエスト';

  @override
  String webview_permission_content(Object kind) {
    return 'WebViewが権限 \'\'$kind\'\' をリクエストしました';
  }

  @override
  String get deny => '拒否';

  @override
  String get allow => '許可';

  @override
  String get not_initialized => '未初期化';

  @override
  String get session_expired => 'セッションが期限切れです。再ログインしてください';
}
