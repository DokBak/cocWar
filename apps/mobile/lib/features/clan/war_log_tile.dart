import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'clan_badge.dart';
import 'war_date.dart';

String formatPercent(double? v) {
  if (v == null) return '-';
  return '${v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1)}%';
}

/// 결과 라벨 칸의 너비. 현재 언어의 가장 긴 라벨(승리/패배/무승부)을 실제 글자 스타일과
/// 글자 크기 배율로 측정해서, 어떤 언어·글자 크기에서도 줄바꿈 없이 들어가게 한다.
/// 모든 행이 같은 너비를 써서 배지 위치도 맞는다.
double resultLabelWidth(
  BuildContext context,
  AppLocalizations l10n,
  TextStyle? style,
) {
  var widest = 0.0;
  for (final text in [l10n.resultWin, l10n.resultLose, l10n.resultTie]) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: 1,
    )..layout();
    if (painter.width > widest) widest = painter.width;
    painter.dispose();
  }
  // 반올림 오차로 줄바꿈되지 않도록 여백을 둔다. 라벨이 짧은 언어에서도 최소 56은 유지한다.
  return widest + 8 < 56 ? 56 : widest + 8;
}

class WarLogTile extends StatelessWidget {
  const WarLogTile({super.key, required this.entry});

  final ClanWarLogEntry entry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;

    final (label, color) = switch (entry.result) {
      WarResult.win => (
        l10n.resultWin,
        dark ? Colors.green.shade300 : Colors.green.shade700,
      ),
      WarResult.lose => (
        l10n.resultLose,
        dark ? Colors.red.shade300 : Colors.red.shade700,
      ),
      WarResult.tie => (
        l10n.resultTie,
        dark ? Colors.amber.shade300 : Colors.amber.shade900,
      ),
      _ => ('-', theme.colorScheme.onSurfaceVariant),
    };
    final labelStyle = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );

    final us = entry.clan;
    final them = entry.opponent;
    final date = entry.endTime == null
        ? null
        : formatWarDate(context, entry.endTime!);
    final size = entry.teamSize == null
        ? null
        : l10n.teamSizeVs(entry.teamSize!);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: resultLabelWidth(context, l10n, labelStyle),
              child: Text(
                label,
                maxLines: 1,
                softWrap: false,
                style: labelStyle?.copyWith(color: color),
              ),
            ),
            ClanBadge(urls: them?.badgeUrls),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    them?.name ?? l10n.unknownOpponent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(
                    [?date, ?size].join(' · '),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '★ ${us?.stars ?? '-'}  ${formatPercent(us?.destructionPercentage)}',
                ),
                Text(
                  '★ ${them?.stars ?? '-'}  ${formatPercent(them?.destructionPercentage)}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
