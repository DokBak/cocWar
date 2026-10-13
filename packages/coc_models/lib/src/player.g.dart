// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerItem _$PlayerItemFromJson(Map<String, dynamic> json) => _PlayerItem(
  name: json['name'] as String?,
  level: (json['level'] as num?)?.toInt(),
  maxLevel: (json['maxLevel'] as num?)?.toInt(),
  village: json['village'] as String?,
  superTroopIsActive: json['superTroopIsActive'] as bool?,
  equipment:
      (json['equipment'] as List<dynamic>?)
          ?.map((e) => PlayerItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlayerItem>[],
);

Map<String, dynamic> _$PlayerItemToJson(_PlayerItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'maxLevel': instance.maxLevel,
      'village': instance.village,
      'superTroopIsActive': instance.superTroopIsActive,
      'equipment': instance.equipment.map((e) => e.toJson()).toList(),
    };

_PlayerClan _$PlayerClanFromJson(Map<String, dynamic> json) => _PlayerClan(
  tag: json['tag'] as String?,
  name: json['name'] as String?,
  clanLevel: (json['clanLevel'] as num?)?.toInt(),
  badgeUrls: json['badgeUrls'] == null
      ? null
      : BadgeUrls.fromJson(json['badgeUrls'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlayerClanToJson(_PlayerClan instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'clanLevel': instance.clanLevel,
      'badgeUrls': instance.badgeUrls?.toJson(),
    };

_Achievement _$AchievementFromJson(Map<String, dynamic> json) => _Achievement(
  name: json['name'] as String?,
  stars: (json['stars'] as num?)?.toInt(),
  value: (json['value'] as num?)?.toInt(),
  target: (json['target'] as num?)?.toInt(),
  info: json['info'] as String?,
  completionInfo: json['completionInfo'] as String?,
  village: json['village'] as String?,
);

Map<String, dynamic> _$AchievementToJson(_Achievement instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stars': instance.stars,
      'value': instance.value,
      'target': instance.target,
      'info': instance.info,
      'completionInfo': instance.completionInfo,
      'village': instance.village,
    };

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
  tag: json['tag'] as String,
  name: json['name'] as String?,
  townHallLevel: (json['townHallLevel'] as num?)?.toInt(),
  townHallWeaponLevel: (json['townHallWeaponLevel'] as num?)?.toInt(),
  expLevel: (json['expLevel'] as num?)?.toInt(),
  trophies: (json['trophies'] as num?)?.toInt(),
  bestTrophies: (json['bestTrophies'] as num?)?.toInt(),
  warStars: (json['warStars'] as num?)?.toInt(),
  attackWins: (json['attackWins'] as num?)?.toInt(),
  defenseWins: (json['defenseWins'] as num?)?.toInt(),
  builderHallLevel: (json['builderHallLevel'] as num?)?.toInt(),
  builderBaseTrophies: (json['builderBaseTrophies'] as num?)?.toInt(),
  bestBuilderBaseTrophies: (json['bestBuilderBaseTrophies'] as num?)?.toInt(),
  role: json['role'] as String?,
  warPreference: json['warPreference'] as String?,
  donations: (json['donations'] as num?)?.toInt(),
  donationsReceived: (json['donationsReceived'] as num?)?.toInt(),
  clanCapitalContributions: (json['clanCapitalContributions'] as num?)?.toInt(),
  clan: json['clan'] == null
      ? null
      : PlayerClan.fromJson(json['clan'] as Map<String, dynamic>),
  league: json['league'] == null
      ? null
      : League.fromJson(json['league'] as Map<String, dynamic>),
  leagueTier: json['leagueTier'] == null
      ? null
      : League.fromJson(json['leagueTier'] as Map<String, dynamic>),
  builderBaseLeague: json['builderBaseLeague'] == null
      ? null
      : League.fromJson(json['builderBaseLeague'] as Map<String, dynamic>),
  labels:
      (json['labels'] as List<dynamic>?)
          ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Label>[],
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Achievement>[],
  troops:
      (json['troops'] as List<dynamic>?)
          ?.map((e) => PlayerItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlayerItem>[],
  heroes:
      (json['heroes'] as List<dynamic>?)
          ?.map((e) => PlayerItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlayerItem>[],
  heroEquipment:
      (json['heroEquipment'] as List<dynamic>?)
          ?.map((e) => PlayerItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlayerItem>[],
  spells:
      (json['spells'] as List<dynamic>?)
          ?.map((e) => PlayerItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlayerItem>[],
);

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
  'tag': instance.tag,
  'name': instance.name,
  'townHallLevel': instance.townHallLevel,
  'townHallWeaponLevel': instance.townHallWeaponLevel,
  'expLevel': instance.expLevel,
  'trophies': instance.trophies,
  'bestTrophies': instance.bestTrophies,
  'warStars': instance.warStars,
  'attackWins': instance.attackWins,
  'defenseWins': instance.defenseWins,
  'builderHallLevel': instance.builderHallLevel,
  'builderBaseTrophies': instance.builderBaseTrophies,
  'bestBuilderBaseTrophies': instance.bestBuilderBaseTrophies,
  'role': instance.role,
  'warPreference': instance.warPreference,
  'donations': instance.donations,
  'donationsReceived': instance.donationsReceived,
  'clanCapitalContributions': instance.clanCapitalContributions,
  'clan': instance.clan?.toJson(),
  'league': instance.league?.toJson(),
  'leagueTier': instance.leagueTier?.toJson(),
  'builderBaseLeague': instance.builderBaseLeague?.toJson(),
  'labels': instance.labels.map((e) => e.toJson()).toList(),
  'achievements': instance.achievements.map((e) => e.toJson()).toList(),
  'troops': instance.troops.map((e) => e.toJson()).toList(),
  'heroes': instance.heroes.map((e) => e.toJson()).toList(),
  'heroEquipment': instance.heroEquipment.map((e) => e.toJson()).toList(),
  'spells': instance.spells.map((e) => e.toJson()).toList(),
};
