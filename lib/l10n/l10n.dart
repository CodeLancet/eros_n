import 'package:eros_n/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Compatibility shim on top of gen-l10n's [AppLocalizations].
///
/// Replaces the old intl_utils-generated `L10n` class:
/// - `L10n.of(context)`  -> [L10n.of] (delegates to `AppLocalizations.of`)
/// - `L10n.current`      -> [L10n.current] (last instance loaded by the
///   delegate; intl_utils kept this as a global, gen-l10n has no equivalent)
/// - `L10n.delegate`     -> [L10n.delegate] (tracks the loaded locale so
///   `current` stays in sync)
///
/// Once no call site needs `L10n.current` without a BuildContext anymore,
/// this shim can be deleted and call sites moved to `AppLocalizations.of`.
class L10n {
  L10n._();

  static AppLocalizations? _current;

  /// The [AppLocalizations] instance of the locale currently active in the
  /// widget tree (set by [L10nDelegate.load]).
  ///
  /// Prefer `AppLocalizations.of(context)` in widgets; use this only where no
  /// BuildContext is reachable (e.g. inside riverpod providers).
  static AppLocalizations get current {
    assert(
      _current != null,
      'No AppLocalizations loaded yet. Add L10n.delegate to '
      'localizationsDelegates in MaterialApp.',
    );
    return _current!;
  }

  /// Convenience accessor mirroring the old `AppLocalizations.of(context)`.
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context);
  }

  /// Wraps [AppLocalizations.delegate] and records the loaded instance so
  /// [current] works without a BuildContext.
  static const LocalizationsDelegate<AppLocalizations> delegate =
      L10nDelegate();
}

class L10nDelegate extends LocalizationsDelegate<AppLocalizations> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.delegate.isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final instance = await AppLocalizations.delegate.load(locale);
    // Old intl_utils L10n.load did this; keep DateFormat/number formatting
    // aligned with the active locale.
    Intl.defaultLocale = locale.toString();
    L10n._current = instance;
    return instance;
  }

  @override
  bool shouldReload(L10nDelegate old) => false;
}
