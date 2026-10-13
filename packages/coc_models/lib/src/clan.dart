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
    int? expLevel,
    League? league,
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
    int? requiredTrophies,
    String? warFrequency,
    int? warWinStreak,
    int? warWins,
    int? warTies,
    int? warLosses,
    bool? isWarLogPublic,
    int? members,
    @Default(<ClanMember>[]) List<ClanMember> memberList,
    @Default(<Label>[]) List<Label> labels,
  }) = _Clan;

  factory Clan.fromJson(Map<String, dynamic> json) => _$ClanFromJson(json);
}
