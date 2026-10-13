import 'package:freezed_annotation/freezed_annotation.dart';

import 'coc_date_time.dart';
import 'paging.dart';

part 'capital_raid.freezed.dart';
part 'capital_raid.g.dart';

/// 캐피탈 레이드 시즌 상태.
@JsonEnum(fieldRename: FieldRename.none)
enum RaidState { ongoing, ended, unknown }

/// 레이드에 참여한 멤버. API는 **공격한 멤버만** 목록에 넣어 준다(공격하지 않은 클랜원은 없음).
@freezed
abstract class CapitalRaidMember with _$CapitalRaidMember {
  const factory CapitalRaidMember({
    String? tag,
    String? name,

    /// 사용한 공격 수.
    int? attacks,

    /// 기본 공격 한도.
    int? attackLimit,

    /// 추가로 얻은 공격 한도. 전체 공격권은 `attackLimit + bonusAttackLimit`.
    int? bonusAttackLimit,
    int? capitalResourcesLooted,
  }) = _CapitalRaidMember;

  factory CapitalRaidMember.fromJson(Map<String, dynamic> json) =>
      _$CapitalRaidMemberFromJson(json);
}

/// 캐피탈 레이드 한 시즌(주말). `attackLog`/`defenseLog`는 아직 읽지 않는다.
@freezed
abstract class CapitalRaidSeason with _$CapitalRaidSeason {
  const factory CapitalRaidSeason({
    @JsonKey(unknownEnumValue: RaidState.unknown) RaidState? state,
    @CocDateTimeConverter() DateTime? startTime,
    @CocDateTimeConverter() DateTime? endTime,
    int? capitalTotalLoot,
    int? raidsCompleted,
    int? totalAttacks,
    int? enemyDistrictsDestroyed,
    int? offensiveReward,
    int? defensiveReward,

    /// 최근 시즌에만 채워져 있다. 과거 시즌은 비어 있다.
    @Default(<CapitalRaidMember>[]) List<CapitalRaidMember> members,
  }) = _CapitalRaidSeason;

  factory CapitalRaidSeason.fromJson(Map<String, dynamic> json) =>
      _$CapitalRaidSeasonFromJson(json);
}

@freezed
abstract class CapitalRaidSeasons with _$CapitalRaidSeasons {
  const factory CapitalRaidSeasons({
    @Default(<CapitalRaidSeason>[]) List<CapitalRaidSeason> items,
    Paging? paging,
  }) = _CapitalRaidSeasons;

  factory CapitalRaidSeasons.fromJson(Map<String, dynamic> json) =>
      _$CapitalRaidSeasonsFromJson(json);
}
