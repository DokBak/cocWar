// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'war_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarClan _$WarClanFromJson(Map<String, dynamic> json) => _WarClan(
  tag: json['tag'] as String?,
  name: json['name'] as String?,
  badgeUrls: json['badgeUrls'] == null
      ? null
      : BadgeUrls.fromJson(json['badgeUrls'] as Map<String, dynamic>),
  clanLevel: (json['clanLevel'] as num?)?.toInt(),
  attacks: (json['attacks'] as num?)?.toInt(),
  stars: (json['stars'] as num?)?.toInt(),
  destructionPercentage: (json['destructionPercentage'] as num?)?.toDouble(),
  expEarned: (json['expEarned'] as num?)?.toInt(),
);

Map<String, dynamic> _$WarClanToJson(_WarClan instance) => <String, dynamic>{
  'tag': instance.tag,
  'name': instance.name,
  'badgeUrls': instance.badgeUrls?.toJson(),
  'clanLevel': instance.clanLevel,
  'attacks': instance.attacks,
  'stars': instance.stars,
  'destructionPercentage': instance.destructionPercentage,
  'expEarned': instance.expEarned,
};

_ClanWarLogEntry _$ClanWarLogEntryFromJson(Map<String, dynamic> json) =>
    _ClanWarLogEntry(
      result: $enumDecodeNullable(
        _$WarResultEnumMap,
        json['result'],
        unknownValue: WarResult.unknown,
      ),
      endTime: const CocDateTimeConverter().fromJson(
        json['endTime'] as String?,
      ),
      teamSize: (json['teamSize'] as num?)?.toInt(),
      attacksPerMember: (json['attacksPerMember'] as num?)?.toInt(),
      battleModifier: json['battleModifier'] as String?,
      clan: json['clan'] == null
          ? null
          : WarClan.fromJson(json['clan'] as Map<String, dynamic>),
      opponent: json['opponent'] == null
          ? null
          : WarClan.fromJson(json['opponent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClanWarLogEntryToJson(_ClanWarLogEntry instance) =>
    <String, dynamic>{
      'result': _$WarResultEnumMap[instance.result],
      'endTime': const CocDateTimeConverter().toJson(instance.endTime),
      'teamSize': instance.teamSize,
      'attacksPerMember': instance.attacksPerMember,
      'battleModifier': instance.battleModifier,
      'clan': instance.clan?.toJson(),
      'opponent': instance.opponent?.toJson(),
    };

const _$WarResultEnumMap = {
  WarResult.win: 'win',
  WarResult.lose: 'lose',
  WarResult.tie: 'tie',
  WarResult.unknown: 'unknown',
};

_ClanWarLog _$ClanWarLogFromJson(Map<String, dynamic> json) => _ClanWarLog(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ClanWarLogEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ClanWarLogEntry>[],
  paging: json['paging'] == null
      ? null
      : Paging.fromJson(json['paging'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ClanWarLogToJson(_ClanWarLog instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'paging': instance.paging?.toJson(),
    };
