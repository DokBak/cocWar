// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capital_raid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CapitalRaidMember _$CapitalRaidMemberFromJson(Map<String, dynamic> json) =>
    _CapitalRaidMember(
      tag: json['tag'] as String?,
      name: json['name'] as String?,
      attacks: (json['attacks'] as num?)?.toInt(),
      attackLimit: (json['attackLimit'] as num?)?.toInt(),
      bonusAttackLimit: (json['bonusAttackLimit'] as num?)?.toInt(),
      capitalResourcesLooted: (json['capitalResourcesLooted'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CapitalRaidMemberToJson(_CapitalRaidMember instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'attacks': instance.attacks,
      'attackLimit': instance.attackLimit,
      'bonusAttackLimit': instance.bonusAttackLimit,
      'capitalResourcesLooted': instance.capitalResourcesLooted,
    };

_CapitalRaidSeason _$CapitalRaidSeasonFromJson(
  Map<String, dynamic> json,
) => _CapitalRaidSeason(
  state: $enumDecodeNullable(
    _$RaidStateEnumMap,
    json['state'],
    unknownValue: RaidState.unknown,
  ),
  startTime: const CocDateTimeConverter().fromJson(
    json['startTime'] as String?,
  ),
  endTime: const CocDateTimeConverter().fromJson(json['endTime'] as String?),
  capitalTotalLoot: (json['capitalTotalLoot'] as num?)?.toInt(),
  raidsCompleted: (json['raidsCompleted'] as num?)?.toInt(),
  totalAttacks: (json['totalAttacks'] as num?)?.toInt(),
  enemyDistrictsDestroyed: (json['enemyDistrictsDestroyed'] as num?)?.toInt(),
  offensiveReward: (json['offensiveReward'] as num?)?.toInt(),
  defensiveReward: (json['defensiveReward'] as num?)?.toInt(),
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => CapitalRaidMember.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CapitalRaidMember>[],
);

Map<String, dynamic> _$CapitalRaidSeasonToJson(_CapitalRaidSeason instance) =>
    <String, dynamic>{
      'state': _$RaidStateEnumMap[instance.state],
      'startTime': const CocDateTimeConverter().toJson(instance.startTime),
      'endTime': const CocDateTimeConverter().toJson(instance.endTime),
      'capitalTotalLoot': instance.capitalTotalLoot,
      'raidsCompleted': instance.raidsCompleted,
      'totalAttacks': instance.totalAttacks,
      'enemyDistrictsDestroyed': instance.enemyDistrictsDestroyed,
      'offensiveReward': instance.offensiveReward,
      'defensiveReward': instance.defensiveReward,
      'members': instance.members.map((e) => e.toJson()).toList(),
    };

const _$RaidStateEnumMap = {
  RaidState.ongoing: 'ongoing',
  RaidState.ended: 'ended',
  RaidState.unknown: 'unknown',
};

_CapitalRaidSeasons _$CapitalRaidSeasonsFromJson(Map<String, dynamic> json) =>
    _CapitalRaidSeasons(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => CapitalRaidSeason.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <CapitalRaidSeason>[],
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CapitalRaidSeasonsToJson(_CapitalRaidSeasons instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'paging': instance.paging?.toJson(),
    };
