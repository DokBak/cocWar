import 'package:coc_models/coc_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import 'cwl_stats.dart';

/// 클랜전 리그 그룹. 리그전 기간이 아니면 notFound 오류다.
final leagueGroupProvider = FutureProvider.autoDispose
    .family<ClanWarLeagueGroup, String>(
      (ref, tag) => ref.watch(apiClientProvider).getLeagueGroup(tag),
    );

/// 리그전 한 경기(원본 그대로, 방향을 맞추지 않음).
final cwlWarProvider = FutureProvider.autoDispose.family<CurrentWar, String>(
  (ref, warTag) => ref.watch(apiClientProvider).getCwlWar(warTag),
);

/// 그룹과 정해진 모든 경기(최대 7라운드 × 4경기)를 한꺼번에 받는다.
final cwlSeasonProvider = FutureProvider.autoDispose.family<CwlSeason, String>((
  ref,
  tag,
) async {
  final group = await ref.watch(leagueGroupProvider(tag).future);
  final rounds = await Future.wait([
    for (final round in group.rounds)
      Future.wait([
        for (final warTag in round.warTags)
          if (warTag != unscheduledWarTag)
            ref
                .watch(cwlWarProvider(warTag).future)
                .then((war) => (warTag: warTag, war: war)),
      ]),
  ]);
  return CwlSeason(group: group, rounds: rounds);
});

/// "리그전 정보 보기" 버튼용. **준비일·전투일일 때만** 그룹을 돌려준다.
///
/// 리그전 기간이 아니면(404) 또는 다른 오류가 나면 null이다. 버튼은 보조 기능이라 오류를 띄우지 않는다.
final ongoingLeagueProvider = FutureProvider.autoDispose
    .family<ClanWarLeagueGroup?, String>((ref, tag) async {
      try {
        final group = await ref.watch(leagueGroupProvider(tag).future);
        return group.state == LeagueGroupState.preparation ||
                group.state == LeagueGroupState.inWar
            ? group
            : null;
      } catch (_) {
        return null;
      }
    });
