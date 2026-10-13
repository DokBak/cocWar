// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClanMember _$ClanMemberFromJson(Map<String, dynamic> json) => _ClanMember(
  tag: json['tag'] as String?,
  name: json['name'] as String?,
  role: json['role'] as String?,
  townHallLevel: (json['townHallLevel'] as num?)?.toInt(),
  expLevel: (json['expLevel'] as num?)?.toInt(),
  league: json['league'] == null
      ? null
      : League.fromJson(json['league'] as Map<String, dynamic>),
  leagueTier: json['leagueTier'] == null
      ? null
      : League.fromJson(json['leagueTier'] as Map<String, dynamic>),
  trophies: (json['trophies'] as num?)?.toInt(),
  builderBaseTrophies: (json['builderBaseTrophies'] as num?)?.toInt(),
  clanRank: (json['clanRank'] as num?)?.toInt(),
  previousClanRank: (json['previousClanRank'] as num?)?.toInt(),
  donations: (json['donations'] as num?)?.toInt(),
  donationsReceived: (json['donationsReceived'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClanMemberToJson(_ClanMember instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'role': instance.role,
      'townHallLevel': instance.townHallLevel,
      'expLevel': instance.expLevel,
      'league': instance.league?.toJson(),
      'leagueTier': instance.leagueTier?.toJson(),
      'trophies': instance.trophies,
      'builderBaseTrophies': instance.builderBaseTrophies,
      'clanRank': instance.clanRank,
      'previousClanRank': instance.previousClanRank,
      'donations': instance.donations,
      'donationsReceived': instance.donationsReceived,
    };

_Clan _$ClanFromJson(Map<String, dynamic> json) => _Clan(
  tag: json['tag'] as String,
  name: json['name'] as String?,
  type: json['type'] as String?,
  description: json['description'] as String?,
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  badgeUrls: json['badgeUrls'] == null
      ? null
      : BadgeUrls.fromJson(json['badgeUrls'] as Map<String, dynamic>),
  clanLevel: (json['clanLevel'] as num?)?.toInt(),
  clanPoints: (json['clanPoints'] as num?)?.toInt(),
  clanBuilderBasePoints: (json['clanBuilderBasePoints'] as num?)?.toInt(),
  clanCapitalPoints: (json['clanCapitalPoints'] as num?)?.toInt(),
  requiredTrophies: (json['requiredTrophies'] as num?)?.toInt(),
  warFrequency: json['warFrequency'] as String?,
  warWinStreak: (json['warWinStreak'] as num?)?.toInt(),
  warWins: (json['warWins'] as num?)?.toInt(),
  warTies: (json['warTies'] as num?)?.toInt(),
  warLosses: (json['warLosses'] as num?)?.toInt(),
  isWarLogPublic: json['isWarLogPublic'] as bool?,
  members: (json['members'] as num?)?.toInt(),
  warLeague: json['warLeague'] == null
      ? null
      : League.fromJson(json['warLeague'] as Map<String, dynamic>),
  capitalLeague: json['capitalLeague'] == null
      ? null
      : League.fromJson(json['capitalLeague'] as Map<String, dynamic>),
  memberList:
      (json['memberList'] as List<dynamic>?)
          ?.map((e) => ClanMember.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ClanMember>[],
  labels:
      (json['labels'] as List<dynamic>?)
          ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Label>[],
);

Map<String, dynamic> _$ClanToJson(_Clan instance) => <String, dynamic>{
  'tag': instance.tag,
  'name': instance.name,
  'type': instance.type,
  'description': instance.description,
  'location': instance.location?.toJson(),
  'badgeUrls': instance.badgeUrls?.toJson(),
  'clanLevel': instance.clanLevel,
  'clanPoints': instance.clanPoints,
  'clanBuilderBasePoints': instance.clanBuilderBasePoints,
  'clanCapitalPoints': instance.clanCapitalPoints,
  'requiredTrophies': instance.requiredTrophies,
  'warFrequency': instance.warFrequency,
  'warWinStreak': instance.warWinStreak,
  'warWins': instance.warWins,
  'warTies': instance.warTies,
  'warLosses': instance.warLosses,
  'isWarLogPublic': instance.isWarLogPublic,
  'members': instance.members,
  'warLeague': instance.warLeague?.toJson(),
  'capitalLeague': instance.capitalLeague?.toJson(),
  'memberList': instance.memberList.map((e) => e.toJson()).toList(),
  'labels': instance.labels.map((e) => e.toJson()).toList(),
};
