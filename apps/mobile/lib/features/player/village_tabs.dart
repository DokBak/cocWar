import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'player_providers.dart';
import 'player_sections.dart';
import 'player_stats.dart';

enum Village { home, builder }

/// 본마을 / 장인기지 탭. 선택은 이 화면을 보는 동안만 유지한다.
class VillageTabs extends StatefulWidget {
  const VillageTabs({super.key, required this.player});

  final Player player;

  @override
  State<VillageTabs> createState() => _VillageTabsState();
}

class _VillageTabsState extends State<VillageTabs> {
  Village _village = Village.home;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final player = widget.player;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SegmentedButton<Village>(
          segments: [
            ButtonSegment(
              value: Village.home,
              label: Text(l10n.tabHomeVillage),
              icon: const Icon(Icons.home_outlined),
            ),
            ButtonSegment(
              value: Village.builder,
              label: Text(l10n.tabBuilderBase),
              icon: const Icon(Icons.construction),
            ),
          ],
          selected: {_village},
          onSelectionChanged: (s) => setState(() => _village = s.first),
        ),
        const SizedBox(height: 12),
        if (_village == Village.home) ...[
          StatGrid(stats: homeStats(l10n, player)),
          ProfileSections(player: player),
        ] else if (!player.hasBuilderBase)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(child: Text(l10n.noBuilderBase)),
          )
        else ...[
          StatGrid(stats: builderStats(l10n, player)),
          BuilderSections(player: player),
        ],
      ],
    );
  }
}
