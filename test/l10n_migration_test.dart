import 'package:eros_n/l10n/generated/app_localizations.dart';
import 'package:eros_n/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Verifies the intl_utils -> gen-l10n migration:
/// - generated localizations load for every supported locale
/// - placeholder messages keep their old signatures
/// - the ICU-escaped single quotes survive codegen
/// - the L10n shim exposes the loaded instance without a BuildContext
void main() {
  test('AppLocalizations loads for all supported locales', () async {
    for (final locale in AppLocalizations.supportedLocales) {
      final l = await AppLocalizations.delegate.load(locale);
      expect(l.app_title, 'Eros-N', reason: 'app_title for $locale');
      expect(l.language_name, isNotEmpty, reason: 'language_name for $locale');
    }
  });

  test('base zh locale resolves and matches zh_CN strings', () async {
    final zh = await AppLocalizations.delegate.load(const Locale('zh'));
    final zhCn = await AppLocalizations.delegate.load(const Locale('zh', 'CN'));
    expect(zh.settings, zhCn.settings);
    // spot-check a translated value
    expect(zhCn.settings, '设置');
  });

  test('placeholder messages keep old signatures', () async {
    final en = await AppLocalizations.delegate.load(const Locale('en'));
    expect(en.download_total_pages(5), '5 pages');
    expect(en.download_progress(3, 5), '3 / 5 pages');
    expect(en.favorite_failed('boom'), 'Failed to update favorite: boom');
    expect(en.added_on('2024-01-01'), 'Added 2024-01-01');
    expect(en.cdn_warn_moderate(30, 3, 10),
        contains('Total concurrent requests: 30 (3 × 10)'));
    expect(en.translation_cache_entries(7), '7 cached translations');
    expect(en.tag_translation_tip('v2'), contains('v2'));
  });

  test('ICU-escaped single quotes survive codegen', () async {
    final en = await AppLocalizations.delegate.load(const Locale('en'));
    expect(en.webview_permission_content('camera'),
        "WebView has requested permission ''camera''");
    // fr apostrophes must not be treated as ICU syntax
    final fr = await AppLocalizations.delegate.load(const Locale('fr'));
    expect(fr.register, "S'inscrire");
  });

  test('L10n shim tracks the loaded instance for L10n.current', () async {
    final zhCn = await L10n.delegate.load(const Locale('zh', 'CN'));
    expect(L10n.current, same(zhCn));
    expect(L10n.current.settings, '设置');
  });

  testWidgets('AppLocalizations.of resolves in the widget tree',
      (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [L10n.delegate],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );
    // L10nDelegate.load is async; give the frame pipeline time to settle.
    await tester.pumpAndSettle();
    expect(AppLocalizations.of(captured).app_title, 'Eros-N');
    expect(L10n.current.app_title, 'Eros-N');
  });
}
