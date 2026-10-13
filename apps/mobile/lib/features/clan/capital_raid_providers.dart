import 'package:coc_models/coc_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';

/// 레이드에서 모든 멤버가 갖는 기본 공격 한도. 공격하지 않은 클랜원은 API 목록에 없어
/// 보너스 여부를 알 수 없으므로 기본 한도로 표시한다.
const defaultRaidAttackLimit = 5;

/// 가장 최근 캐피탈 레이드 시즌 한 건. 진행 중이면 진행 중인 시즌, 아니면 직전에 끝난 시즌이다.
///
/// 시즌이 없거나 조회에 실패하면(전쟁 로그 비공개 403 등) null이다.
/// 멤버 목록의 보조 정보라서 오류를 화면에 띄우지 않고 해당 칸만 숨긴다.
final latestRaidProvider = FutureProvider.autoDispose
    .family<CapitalRaidSeason?, String>((ref, tag) async {
      try {
        final seasons = await ref
            .watch(apiClientProvider)
            .getCapitalRaidSeasons(tag, limit: 1);
        return seasons.items.isEmpty ? null : seasons.items.first;
      } catch (_) {
        return null;
      }
    });

/// 한 멤버의 공격권 사용 현황: 사용한 수 / 전체.
class RaidUsage {
  const RaidUsage(this.used, this.total);

  final int used;
  final int total;

  /// 공격권을 모두 썼는지.
  bool get complete => total > 0 && used >= total;
  bool get none => used == 0;

  @override
  bool operator ==(Object other) =>
      other is RaidUsage && other.used == used && other.total == total;

  @override
  int get hashCode => Object.hash(used, total);

  @override
  String toString() => '$used/$total';
}

/// 시즌의 멤버 목록을 믿고 쓸 수 있는지. 공격 기록은 있는데 멤버 목록이 비어 있으면
/// (과거 시즌처럼 멤버가 내려오지 않는 경우) 공격하지 않은 것으로 오해하지 않도록 쓰지 않는다.
bool raidMembersAvailable(CapitalRaidSeason season) =>
    season.members.isNotEmpty || (season.totalAttacks ?? 0) == 0;

/// [memberTag] 멤버의 공격권 사용 현황.
///
/// 전체 공격권은 `attackLimit + bonusAttackLimit`. 레이드 멤버 목록에 없는 멤버는
/// 공격하지 않은 것이므로 `0/5`다.
RaidUsage raidUsage(CapitalRaidSeason season, String? memberTag) {
  final member = season.members.where((m) => m.tag == memberTag).firstOrNull;
  if (member == null) return const RaidUsage(0, defaultRaidAttackLimit);
  return RaidUsage(
    member.attacks ?? 0,
    (member.attackLimit ?? defaultRaidAttackLimit) +
        (member.bonusAttackLimit ?? 0),
  );
}
