import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'clan.freezed.dart';
part 'clan.g.dart';

@freezed
abstract class ClanMember with _$ClanMember {
  const factory ClanMember({
    String? tag,
    String? name,
    String? role,
    int? townHallLevel,
    int? expLevel,
    League? league,
    // 새 리그 체계. 구 `league`는 Unranked로만 내려오는 경우가 있다.
    League? leagueTier,
    int? trophies,
    int? builderBaseTrophies,
    int? clanRank,
    int? previousClanRank,
    int? donations,
    int? donationsReceived,
  }) = _ClanMember;

  factory ClanMember.fromJson(Map<String, dynamic> json) =>
      _$ClanMemberFromJson(json);
}

@freezed
abstract class Clan with _$Clan {
  const factory Clan({
    required String tag,
    String? name,
    String? type,
    String? description,
    Location? location,
    BadgeUrls? badgeUrls,
    int? clanLevel,
    int? clanPoints,
    int? clanBuilderBasePoints,

    /// 캐피탈 트로피.
    int? clanCapitalPoints,
    int? requiredTrophies,
    String? warFrequency,
    int? warWinStreak,
    int? warWins,
    int? warTies,
    int? warLosses,
    bool? isWarLogPublic,
    int? members,

    /// 클랜전(리그전) 리그. 이름만 오고 아이콘 주소는 없다 — 이름이 같은 기존 리그(`/leagues`)의 아이콘을 쓴다.
    League? warLeague,
    League? capitalLeague,
    @Default(<ClanMember>[]) List<ClanMember> memberList,
    @Default(<Label>[]) List<Label> labels,
  }) = _Clan;

  factory Clan.fromJson(Map<String, dynamic> json) => _$ClanFromJson(json);
}
