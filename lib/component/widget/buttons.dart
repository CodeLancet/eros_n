import 'package:eros_n/common/enum.dart';
import 'package:eros_n/l10n/generated/app_localizations.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';

typedef AsyncValueChanged<T> = Future<void> Function(T value);

class SortPopupButton extends StatefulWidget {
  const SortPopupButton({
    super.key,
    required this.onSelected,
    this.initValue = SearchSort.recent,
    this.iconSize,
  });

  final AsyncValueChanged<SearchSort> onSelected;
  final SearchSort initValue;
  final double? iconSize;

  @override
  State<SortPopupButton> createState() => _SortPopupButtonState();
}

class _SortPopupButtonState extends State<SortPopupButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final sortMap = {
      SearchSort.recent: AppLocalizations.of(context).recent,
      SearchSort.popularToday: AppLocalizations.of(context).popular_today,
      SearchSort.popularWeek: AppLocalizations.of(context).popular_week,
      SearchSort.popularMonth: AppLocalizations.of(context).popular_month,
      SearchSort.popular: AppLocalizations.of(context).popular,
    };

    logger.t('loading $loading');

    final indicatorSize =
        (widget.iconSize ?? Theme.of(context).iconTheme.size ?? 24.0) * 0.8;

    return PopupMenuButton<SearchSort>(
      onSelected: (val) async {
        try {
          setState(() {
            loading = true;
          });
          await widget.onSelected(val);
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      enabled: !loading,
      padding: EdgeInsets.zero,
      icon: loading
          ? SizedBox(
              width: indicatorSize,
              height: indicatorSize,
              child: const CircularProgressIndicator(strokeWidth: 3),
            )
          : const Icon(Icons.sort),
      iconSize: widget.iconSize,
      offset: const Offset(0, kToolbarHeight),
      // color: Theme.of(context).colorScheme.onInverseSurface,
      initialValue: widget.initValue,
      itemBuilder: (context) => sortMap.entries
          .map(
            (e) =>
                PopupMenuItem<SearchSort>(value: e.key, child: Text(e.value)),
          )
          .toList(),
    );
  }
}

// LanguagesFilterPopupButton
class LanguagesFilterPopupButton extends StatefulWidget {
  const LanguagesFilterPopupButton({
    super.key,
    required this.onSelected,
    this.initValue = LanguagesFilter.all,
    this.iconSize,
  });

  final AsyncValueChanged<LanguagesFilter> onSelected;
  final LanguagesFilter initValue;
  final double? iconSize;

  @override
  State<LanguagesFilterPopupButton> createState() =>
      _LanguagesFilterPopupButtonState();
}

class _LanguagesFilterPopupButtonState
    extends State<LanguagesFilterPopupButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final languagesMap = {
      LanguagesFilter.all: AppLocalizations.of(context).all,
      LanguagesFilter.japanese: AppLocalizations.of(context).japanese,
      LanguagesFilter.chinese: AppLocalizations.of(context).chinese,
      LanguagesFilter.english: AppLocalizations.of(context).english,
      LanguagesFilter.translated: AppLocalizations.of(context).translated,
    };

    final indicatorSize =
        (widget.iconSize ?? Theme.of(context).iconTheme.size ?? 24.0) * 0.8;

    return PopupMenuButton<LanguagesFilter>(
      onSelected: (val) async {
        try {
          setState(() {
            loading = true;
          });
          await widget.onSelected(val);
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      padding: EdgeInsets.zero,
      icon: loading
          ? SizedBox(
              width: indicatorSize,
              height: indicatorSize,
              child: const CircularProgressIndicator(strokeWidth: 3),
            )
          : const Icon(Icons.language),
      iconSize: widget.iconSize,
      offset: const Offset(0, kToolbarHeight),
      initialValue: widget.initValue,
      itemBuilder: (context) => languagesMap.entries
          .map(
            (e) => PopupMenuItem<LanguagesFilter>(
              value: e.key,
              child: Text(e.value),
            ),
          )
          .toList(),
    );
  }
}
