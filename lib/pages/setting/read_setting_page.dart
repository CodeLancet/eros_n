import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/l10n/generated/app_localizations.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReadSettingPage extends ConsumerWidget {
  const ReadSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(AppLocalizations.of(context).read),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: <Widget>[
          SmallTitle(title: AppLocalizations.of(context).display),
          // Switch full screen reader
          const FullScreenListTile(),
          // switch read model
          Consumer(
            builder: (context, ref, child) {
              final readModel = ref.watch(
                settingsProvider.select((settings) => settings.readModel),
              );
              return RadioDialogListTile<ReadModel>(
                title: Text(AppLocalizations.of(context).read_model),
                groupValue: readModel,
                radioTitleMap: {
                  ReadModel.leftToRight: Text(AppLocalizations.of(context).left_to_right),
                  ReadModel.rightToLeft: Text(AppLocalizations.of(context).right_to_left),
                  ReadModel.webtoon: Text(AppLocalizations.of(context).webtoon),
                  ReadModel.curlVertical: Text(AppLocalizations.of(context).curl_vertical),
                  ReadModel.vertical: Text(AppLocalizations.of(context).vertical),
                },
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setReadModel(value);
                },
              );
            },
          ),
          const Divider(height: 1.0),
          // switch volumeKeyTurnPage
          const VolumeKeyTurnPageListTile(),
          const AutoReadIntervalListTile(),
          const PreloadPagesCountListTile(),
        ],
      ),
    );
  }
}

class VolumeKeyTurnPageListTile extends StatelessWidget {
  const VolumeKeyTurnPageListTile({super.key, this.onReadView = false});
  final bool onReadView;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final volumeKeyTurnPage = ref.watch(
          settingsProvider.select((settings) => settings.volumeKeyTurnPage),
        );
        return ListTile(
          title: Text(AppLocalizations.of(context).volume_key_turn_page),
          trailing: Switch(
            activeThumbColor: Theme.of(context).colorScheme.primary,
            value: volumeKeyTurnPage,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).setVolumeKeyTurnPage(value);

              if (onReadView) {
                if (value) {
                  ref.read(readProvider.notifier).addVolumeKeydownListen();
                } else {
                  ref.read(readProvider.notifier).closeVolumeKeydownListen();
                }
              }
            },
          ),
        );
      },
    );
  }
}

class FullScreenListTile extends HookConsumerWidget {
  const FullScreenListTile({super.key, this.onReadView = false});
  final bool onReadView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullScreenReader = ref.watch(
      settingsProvider.select((settings) => settings.fullScreenReader),
    );
    return ListTile(
      title: Text(AppLocalizations.of(context).full_screen),
      trailing: Switch(
        activeThumbColor: Theme.of(context).colorScheme.primary,
        value: fullScreenReader,
        onChanged: (value) {
          ref.read(settingsProvider.notifier).setFullScreenReader(value);

          if (onReadView) {
            if (value) {
              ref.read(readProvider.notifier).setFullscreen();
            } else {
              ref.read(readProvider.notifier).unFullscreen();
            }
          }
        },
      ),
    );
  }
}

class PreloadPagesCountListTile extends HookConsumerWidget {
  const PreloadPagesCountListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preloadPageCount = ref.watch(
      settingsProvider.select((settings) => settings.preloadPagesCount),
    );
    return ListTile(
      title: Text(AppLocalizations.of(context).preload_pages_count),
      subtitle: Row(
        children: [
          Container(
            width: 36,
            alignment: Alignment.center,
            child: Text('$preloadPageCount'),
          ),
          Expanded(
            child: Slider(
              value: preloadPageCount.toDouble(),
              min: 0,
              max: 7,
              divisions: 7,
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .setPreloadPagesCount(value.round());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AutoReadIntervalListTile extends HookConsumerWidget {
  const AutoReadIntervalListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoReadInterval = ref.watch(
      settingsProvider.select((settings) => settings.autoReadInterval),
    );

    return ListTile(
      title: Text(AppLocalizations.of(context).auto_read_interval),
      subtitle: Row(
        children: [
          Container(
            width: 36,
            alignment: Alignment.center,
            child: Text('${autoReadInterval}s'),
          ),
          Expanded(
            child: Slider(
              value: autoReadInterval.toDouble(),
              min: 0.5,
              max: 10,
              divisions: 19,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setAutoReadInterval(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
