import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/l10n/generated/app_localizations.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_by_default/open_by_default.dart';

@RoutePage()
class GeneralSettingPage extends ConsumerWidget {
  const GeneralSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(AppLocalizations.of(context).general),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final localeCode = ref.watch(
                settingsProvider.select((settings) => settings.localeCode),
              );

              final radioTitleMap = {
                '': Text(AppLocalizations.of(context).system),
              };

              // gen-l10n adds a base zh locale as fallback for zh_CN/zh_TW;
              // only offer locales that have an entry in NHConst.localeMap.
              final selectableLocales = AppLocalizations.supportedLocales
                  .where((l) => NHConst.localeMap
                      .containsKey('${l.languageCode}_${l.countryCode ?? ''}'))
                  .toList()
                ..sort((a, b) => a.toString().compareTo(b.toString()));

              for (final locale in selectableLocales) {
                final code = '${locale.languageCode}_${locale.countryCode ?? ''}';
                radioTitleMap[code] = Text(NHConst.localeMap[code]!);
              }

              return RadioDialogListTile<String>(
                title: Text(AppLocalizations.of(context).language),
                groupValue: localeCode,
                radioTitleMap: radioTitleMap,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setLocaleCode(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final hideBottomNavigationOnScroll = ref.watch(
                settingsProvider.select(
                  (settings) => settings.hideBottomNavigationOnScroll,
                ),
              );

              return SwitchListTile(
                title: Text(AppLocalizations.of(context).hide_bottom_navigation_on_scroll),
                value: hideBottomNavigationOnScroll,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setHideBottomNavigationOnScroll(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final clipboardDetection = ref.watch(
                settingsProvider.select(
                  (settings) => settings.clipboardDetection,
                ),
              );

              return SwitchListTile(
                title: Text(AppLocalizations.of(context).clipboard_detection),
                value: clipboardDetection,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setClipboardDetection(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final doubleBackToExit = ref.watch(
                settingsProvider.select(
                  (settings) => settings.doubleBackToExit,
                ),
              );

              return SwitchListTile(
                title: Text(AppLocalizations.of(context).double_back_to_exit),
                value: doubleBackToExit,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setDoubleBackToExit(value);
                },
              );
            },
          ),

          const Divider(),

          ListTile(
            title: Text(AppLocalizations.of(context).translation_settings),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushRoute(const TranslationSettingRoute()),
          ),

          if (defaultTargetPlatform == TargetPlatform.android)
            ListTile(
              title: Text(AppLocalizations.of(context).open_supported_links),
              subtitle: Text(AppLocalizations.of(context).open_supported_links_tip),
              onTap: OpenByDefault.open,
            ),
        ],
      ),
    );
  }
}
