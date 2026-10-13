// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_war.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarAttack _$WarAttackFromJson(Map<String, dynamic> json) => _WarAttack(
  attackerTag: json['attackerTag'] as String?,
  defenderTag: json['defenderTag'] as String?,
  stars: (json['stars'] as num?)?.toInt(),
  destructionPercentage: (json['destructionPercentage'] as num?)?.toDouble(),
  order: (json['order'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
);

Map<String, dynamic> _$WarAttackToJson(_WarAttack instance) =>
    <String, dynamic>{
      'attackerTag': instance.attackerTag,
      'defenderTag': instance.defenderTag,
      'stars': instance.stars,
      'destructionPercentage': instance.destructionPercentage,
      'order': instance.order,
      'duration': instance.duration,
    };

_WarMember _$WarMemberFromJson(Map<String, dynamic> json) => _WarMember(
  tag: json['tag'] as String?,
  name: json['name'] as String?,
  townHallLevel: (json['townhallLevel'] as num?)?.toInt(),
  mapPosition: (json['mapPosition'] as num?)?.toInt(),
  opponentAttacks: (json['opponentAttacks'] as num?)?.toInt(),
  bestOpponentAttack: json['bestOpponentAttack'] == null
      ? null
      : WarAttack.fromJson(json['bestOpponentAttack'] as Map<String, dynamic>),
  attacks:
      (json['attacks'] as List<dynamic>?)
          ?.map((e) => WarAttack.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WarAttack>[],
);

Map<String, dynamic> _$WarMemberToJson(_WarMember instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'townhallLevel': instance.townHallLevel,
      'mapPosition': instance.mapPosition,
      'opponentAttacks': instance.opponentAttacks,
      'bestOpponentAttack': instance.bestOpponentAttack?.toJson(),
      'attacks': instance.attacks.map((e) => e.toJson()).toList(),
    };

_CurrentWarClan _$CurrentWarClanFromJson(Map<String, dynamic> json) =>
    _CurrentWarClan(
      tag: json['tag'] as String?,
      name: json['name'] as String?,
      badgeUrls: json['badgeUrls'] == null
          ? null
          : BadgeUrls.fromJson(json['badgeUrls'] as Map<String, dynamic>),
      clanLevel: (json['clanLevel'] as num?)?.toInt(),
      attacks: (json['attacks'] as num?)?.toInt(),
      stars: (json['stars'] as num?)?.toInt(),
      destructionPercentage: (json['destructionPercentage'] as num?)
          ?.toDouble(),
      members:
          (json['members'] as List<dynamic>?)
              ?.map((e) => WarMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <WarMember>[],
    );

Map<String, dynamic> _$CurrentWarClanToJson(_CurrentWarClan instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'badgeUrls': instance.badgeUrls?.toJson(),
      'clanLevel': instance.clanLevel,
      'attacks': instance.attacks,
      'stars': instance.stars,
      'destructionPercentage': instance.destructionPercentage,
      'members': instance.members.map((e) => e.toJson()).toList(),
    };

_CurrentWar _$CurrentWarFromJson(Map<String, dynamic> json) => _CurrentWar(
  state: $enumDecodeNullable(
    _$WarStateEnumMap,
    json['state'],
    unknownValue: WarState.unknown,
  ),
  teamSize: (json['teamSize'] as num?)?.toInt(),
  attacksPerMember: (json['attacksPerMember'] as num?)?.toInt(),
  battleModifier: json['battleModifier'] as String?,
  preparationStartTime: const CocDateTimeConverter().fromJson(
    json['preparationStartTime'] as String?,
  ),
  startTime: const CocDateTimeConverter().fromJson(
    json['startTime'] as String?,
  ),
  endTime: const CocDateTimeConverter().fromJson(json['endTime'] as String?),
  clan: json['clan'] == null
      ? null
      : CurrentWarClan.fromJson(json['clan'] as Map<String, dynamic>),
  opponent: json['opponent'] == null
      ? null
      : CurrentWarClan.fromJson(json['opponent'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrentWarToJson(_CurrentWar instance) =>
    <String, dynamic>{
      'state': _$WarStateEnumMap[instance.state],
      'teamSize': instance.teamSize,
      'attacksPerMember': instance.attacksPerMember,
      'battleModifier': instance.battleModifier,
      'preparationStartTime': const CocDateTimeConverter().toJson(
        instance.preparationStartTime,
      ),
      'startTime': const CocDateTimeConverter().toJson(instance.startTime),
      'endTime': const CocDateTimeConverter().toJson(instance.endTime),
      'clan': instance.clan?.toJson(),
      'opponent': instance.opponent?.toJson(),
    };

const _$WarStateEnumMap = {
  WarState.notInWar: 'notInWar',
  WarState.preparation: 'preparation',
  WarState.inWar: 'inWar',
  WarState.warEnded: 'warEnded',
  WarState.unknown: 'unknown',
};
