import 'package:eros_n/main.dart';
import 'package:flutter_test/flutter_test.dart';

/// Compile smoke test: importing main.dart pulls in the entire app library
/// graph (all pages, providers, routes and the migrated l10n code), so this
/// file fails to compile if any Dart-level breakage exists after the
/// intl_utils -> gen-l10n migration.
void main() {
  test('app entrypoint compiles', () {
    expect(MyApp, isNotNull);
  });
}
