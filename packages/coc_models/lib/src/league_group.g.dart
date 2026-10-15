// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeagueGroupMember _$LeagueGroupMemberFromJson(Map<String, dynamic> json) =>
    _LeagueGroupMember(
      tag: json['tag'] as String?,
      name: json['name'] as String?,
      townHallLevel: (json['townHallLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeagueGroupMemberToJson(_LeagueGroupMember instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'townHallLevel': instance.townHallLevel,
    };

_LeagueGroupClan _$LeagueGroupClanFromJson(Map<String, dynamic> json) =>
    _LeagueGroupClan(
      tag: json['tag'] as String?,
      name: json['name'] as String?,
      clanLevel: (json['clanLevel'] as num?)?.toInt(),
      badgeUrls: json['badgeUrls'] == null
          ? null
          : BadgeUrls.fromJson(json['badgeUrls'] as Map<String, dynamic>),
      members:
          (json['members'] as List<dynamic>?)
              ?.map(
                (e) => LeagueGroupMember.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <LeagueGroupMember>[],
    );

Map<String, dynamic> _$LeagueGroupClanToJson(_LeagueGroupClan instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'clanLevel': instance.clanLevel,
      'badgeUrls': instance.badgeUrls?.toJson(),
      'members': instance.members.map((e) => e.toJson()).toList(),
    };

_LeagueRound _$LeagueRoundFromJson(Map<String, dynamic> json) => _LeagueRound(
  warTags:
      (json['warTags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$LeagueRoundToJson(_LeagueRound instance) =>
    <String, dynamic>{'warTags': instance.warTags};

_ClanWarLeagueGroup _$ClanWarLeagueGroupFromJson(Map<String, dynamic> json) =>
    _ClanWarLeagueGroup(
      state: $enumDecodeNullable(
        _$LeagueGroupStateEnumMap,
        json['state'],
        unknownValue: LeagueGroupState.unknown,
      ),
      season: json['season'] as String?,
      clans:
          (json['clans'] as List<dynamic>?)
              ?.map((e) => LeagueGroupClan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LeagueGroupClan>[],
      rounds:
          (json['rounds'] as List<dynamic>?)
              ?.map((e) => LeagueRound.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LeagueRound>[],
    );

Map<String, dynamic> _$ClanWarLeagueGroupToJson(_ClanWarLeagueGroup instance) =>
    <String, dynamic>{
      'state': _$LeagueGroupStateEnumMap[instance.state],
      'season': instance.season,
      'clans': instance.clans.map((e) => e.toJson()).toList(),
      'rounds': instance.rounds.map((e) => e.toJson()).toList(),
    };

const _$LeagueGroupStateEnumMap = {
  LeagueGroupState.preparation: 'preparation',
  LeagueGroupState.inWar: 'inWar',
  LeagueGroupState.ended: 'ended',
  LeagueGroupState.notInWar: 'notInWar',
  LeagueGroupState.unknown: 'unknown',
};
