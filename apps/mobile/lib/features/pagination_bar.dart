import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// 표시할 페이지 번호 목록. `null`은 생략 표시(…)다.
///
/// 처음·끝 페이지와 현재 페이지 앞뒤 2개를 보여주고, 사이가 한 페이지뿐이면
/// 생략 표시 대신 그 페이지를 그대로 보여준다. 예: `1 2 [3] 4 5 … 12`
List<int?> pageItems(int current, int total) {
  if (total <= 0) return const [];
  final shown = <int>{
    1,
    total,
    for (var p = current - 2; p <= current + 2; p++)
      if (p >= 1 && p <= total) p,
  }.toList()..sort();

  final result = <int?>[];
  for (var i = 0; i < shown.length; i++) {
    if (i > 0) {
      final gap = shown[i] - shown[i - 1];
      if (gap == 2) {
        result.add(shown[i] - 1);
      } else if (gap > 2) {
        result.add(null);
      }
    }
    result.add(shown[i]);
  }
  return result;
}

/// 번호 페이지 이동 바. 페이지가 1개 이하면 아무것도 그리지 않는다. 페이지는 1부터 시작한다.
class PaginationBar extends StatelessWidget {
  const PaginationBar({
    super.key,
    required this.current,
    required this.total,
    required this.onChanged,
  });

  final int current;
  final int total;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    if (total <= 1) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      children: [
        IconButton(
          tooltip: l10n.previousPage,
          icon: const Icon(Icons.chevron_left),
          onPressed: current > 1 ? () => onChanged(current - 1) : null,
        ),
        for (final p in pageItems(current, total))
          if (p == null)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('…'),
            )
          else
            Semantics(
              selected: p == current,
              label: l10n.pageN(p),
              child: SizedBox(
                width: 40,
                height: 40,
                child: p == current
                    ? FilledButton(
                        onPressed: null,
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.zero,
                          disabledBackgroundColor: theme.colorScheme.primary,
                          disabledForegroundColor: theme.colorScheme.onPrimary,
                        ),
                        child: Text('$p'),
                      )
                    : TextButton(
                        onPressed: () => onChanged(p),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text('$p'),
                      ),
              ),
            ),
        IconButton(
          tooltip: l10n.nextPage,
          icon: const Icon(Icons.chevron_right),
          onPressed: current < total ? () => onChanged(current + 1) : null,
        ),
      ],
    );
  }
}
