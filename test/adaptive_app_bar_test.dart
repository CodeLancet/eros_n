import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/settings.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class _TestSettingsNotifier extends SettingsNotifier {
  _TestSettingsNotifier(this.glass);

  final bool glass;

  @override
  Settings build() => Settings(liquidGlass: glass);
}

void main() {
  for (final glass in [false, true]) {
    testWidgets('adaptive app bar renders with liquidGlass=$glass', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            settingsProvider.overrideWith(() => _TestSettingsNotifier(glass)),
          ],
          child: MaterialApp(
            home: Consumer(
              builder: (context, ref, _) => Scaffold(
                appBar: adaptiveAppBar(
                  context: context,
                  ref: ref,
                  title: const Text('Settings'),
                  actions: const [Icon(Icons.settings)],
                ),
                body: const SizedBox(),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      if (glass) {
        final appBar = tester.widget<GlassAppBar>(find.byType(GlassAppBar));
        expect(appBar.preferredSize.height, kGlassAppBarHeight);
      } else {
        expect(find.byType(AppBar), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });
  }
}
