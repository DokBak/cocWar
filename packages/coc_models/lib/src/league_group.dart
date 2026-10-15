import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'league_group.freezed.dart';
part 'league_group.g.dart';

/// 클랜전 리그 그룹 상태.
@JsonEnum(fieldRename: FieldRename.none)
enum LeagueGroupState { preparation, inWar, ended, notInWar, unknown }

/// 리그전 명단에 오른 멤버. 그룹 응답에는 태그·이름·타운홀만 들어 있다.
@freezed
abstract class LeagueGroupMember with _$LeagueGroupMember {
  const factory LeagueGroupMember({
    String? tag,
    String? name,
    int? townHallLevel,
  }) = _LeagueGroupMember;

  factory LeagueGroupMember.fromJson(Map<String, dynamic> json) =>
      _$LeagueGroupMemberFromJson(json);
}

@freezed
abstract class LeagueGroupClan with _$LeagueGroupClan {
  const factory LeagueGroupClan({
    String? tag,
    String? name,
    int? clanLevel,
    BadgeUrls? badgeUrls,
    @Default(<LeagueGroupMember>[]) List<LeagueGroupMember> members,
  }) = _LeagueGroupClan;

  factory LeagueGroupClan.fromJson(Map<String, dynamic> json) =>
      _$LeagueGroupClanFromJson(json);
}

/// 한 라운드의 전쟁 태그(보통 4개). 아직 대진이 정해지지 않았으면 `#0`이다.
@freezed
abstract class LeagueRound with _$LeagueRound {
  const factory LeagueRound({@Default(<String>[]) List<String> warTags}) =
      _LeagueRound;

  factory LeagueRound.fromJson(Map<String, dynamic> json) =>
      _$LeagueRoundFromJson(json);
}

/// 클랜전 리그 그룹(`/clans/{tag}/currentwar/leaguegroup`). 8개 클랜, 7라운드.
///
/// 개별 전쟁은 `/clanwarleagues/wars/{warTag}`이고 형태는 [CurrentWar]와 같다.
@freezed
abstract class ClanWarLeagueGroup with _$ClanWarLeagueGroup {
  const factory ClanWarLeagueGroup({
    @JsonKey(unknownEnumValue: LeagueGroupState.unknown)
    LeagueGroupState? state,

    /// `2026-11` 형태.
    String? season,
    @Default(<LeagueGroupClan>[]) List<LeagueGroupClan> clans,
    @Default(<LeagueRound>[]) List<LeagueRound> rounds,
  }) = _ClanWarLeagueGroup;

  factory ClanWarLeagueGroup.fromJson(Map<String, dynamic> json) =>
      _$ClanWarLeagueGroupFromJson(json);
}

/// 아직 정해지지 않은 라운드의 전쟁 태그.
const unscheduledWarTag = '#0';
