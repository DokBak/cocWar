import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'player.freezed.dart';
part 'player.g.dart';

/// 영웅, 부대, 주문, 장비에 공통으로 쓰는 항목.
@freezed
abstract class PlayerItem with _$PlayerItem {
  const factory PlayerItem({
    String? name,
    int? level,
    int? maxLevel,
    String? village,
    bool? superTroopIsActive,
    @Default(<PlayerItem>[]) List<PlayerItem> equipment,
  }) = _PlayerItem;

  factory PlayerItem.fromJson(Map<String, dynamic> json) =>
      _$PlayerItemFromJson(json);
}

@freezed
abstract class PlayerClan with _$PlayerClan {
  const factory PlayerClan({
    String? tag,
    String? name,
    int? clanLevel,
    BadgeUrls? badgeUrls,
  }) = _PlayerClan;

  factory PlayerClan.fromJson(Map<String, dynamic> json) =>
      _$PlayerClanFromJson(json);
}

@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    String? name,
    int? stars,
    int? value,
    int? target,
    String? info,
    String? completionInfo,
    String? village,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

@freezed
abstract class Player with _$Player {
  const factory Player({
    required String tag,
    String? name,
    int? townHallLevel,
    int? townHallWeaponLevel,
    int? expLevel,
    int? trophies,
    int? bestTrophies,
    int? warStars,
    int? attackWins,
    int? defenseWins,
    int? builderHallLevel,
    int? builderBaseTrophies,
    int? bestBuilderBaseTrophies,
    String? role,
    String? warPreference,
    int? donations,
    int? donationsReceived,
    int? clanCapitalContributions,
    PlayerClan? clan,
    League? league,
    // 새 리그 체계. 응답에 따라 `league`는 비어 있고 이쪽에만 값이 있다.
    League? leagueTier,
    League? builderBaseLeague,
    @Default(<Label>[]) List<Label> labels,
    @Default(<Achievement>[]) List<Achievement> achievements,
    @Default(<PlayerItem>[]) List<PlayerItem> troops,
    @Default(<PlayerItem>[]) List<PlayerItem> heroes,
    @Default(<PlayerItem>[]) List<PlayerItem> heroEquipment,
    @Default(<PlayerItem>[]) List<PlayerItem> spells,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
