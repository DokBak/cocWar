import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// 천 단위로 쉼표를 넣는다. 값이 없으면 `-`.
String formatCount(int? v) {
  if (v == null) return '-';
  final s = v.abs().toString();
  final buf = StringBuffer(v < 0 ? '-' : '');
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  return buf.toString();
}

/// 통계 한 칸. 이미지 파일 없이 Material 아이콘에 게임과 비슷한 색을 입혀 구분한다.
class Stat {
  const Stat(this.icon, this.color, this.label, this.value);

  final IconData icon;
  final Color color;
  final String label;
  final String value;
}

const _gold = Color(0xFFFFB300);
const _orange = Color(0xFFFB8C00);
const _yellow = Color(0xFFFFC107);
const _blue = Color(0xFF1E88E5);
const _green = Color(0xFF43A047);
const _teal = Color(0xFF00897B);
const _purple = Color(0xFF8E24AA);
const _brown = Color(0xFF8D6E63);

/// 본마을 통계. 트로피·전쟁 별·기부·받은 기부·캐피탈 기여.
List<Stat> homeStats(AppLocalizations l10n, Player p) => [
  Stat(Icons.emoji_events, _gold, l10n.statTrophies, formatCount(p.trophies)),
  Stat(Icons.star, _yellow, l10n.statWarStars, formatCount(p.warStars)),
  Stat(
    Icons.volunteer_activism,
    _green,
    l10n.statDonations,
    formatCount(p.donations),
  ),
  Stat(
    Icons.call_received,
    _teal,
    l10n.statDonationsReceived,
    formatCount(p.donationsReceived),
  ),
  Stat(
    Icons.account_balance,
    _purple,
    l10n.statCapitalContributions,
    formatCount(p.clanCapitalContributions),
  ),
];

/// 장인기지 통계: 장인 회관, 트로피, 최고 기록, 리그.
List<Stat> builderStats(AppLocalizations l10n, Player p) => [
  if (p.builderHallLevel != null)
    Stat(
      Icons.construction,
      _brown,
      l10n.builderHallN(p.builderHallLevel!),
      '${p.builderHallLevel}',
    ),
  Stat(
    Icons.emoji_events,
    _gold,
    l10n.statTrophies,
    formatCount(p.builderBaseTrophies),
  ),
  Stat(
    Icons.workspace_premium,
    _orange,
    l10n.statBestTrophies,
    formatCount(p.bestBuilderBaseTrophies),
  ),
  if (p.builderBaseLeague?.name != null)
    Stat(
      Icons.military_tech,
      _blue,
      l10n.statLeague,
      p.builderBaseLeague!.name!,
    ),
];

class StatGrid extends StatelessWidget {
  const StatGrid({super.key, required this.stats});

  final List<Stat> stats;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [for (final s in stats) _StatBox(stat: s)],
  );
}

class _StatBox extends StatelessWidget {
  const _StatBox({required this.stat});

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(minWidth: 112),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(stat.icon, size: 22, color: stat.color),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(stat.value, style: theme.textTheme.titleMedium),
              Text(stat.label, style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
