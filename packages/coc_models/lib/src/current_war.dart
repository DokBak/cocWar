import 'package:freezed_annotation/freezed_annotation.dart';

import 'coc_date_time.dart';
import 'common.dart';

part 'current_war.freezed.dart';
part 'current_war.g.dart';

/// 클랜전 상태. `notInWar`이면 응답에 `state`만 들어 있다.
@JsonEnum(fieldRename: FieldRename.none)
enum WarState { notInWar, preparation, inWar, warEnded, unknown }

@freezed
abstract class WarAttack with _$WarAttack {
  const factory WarAttack({
    String? attackerTag,
    String? defenderTag,
    int? stars,
    double? destructionPercentage,

    /// 전쟁 전체에서 몇 번째 공격이었는지.
    int? order,

    /// 공격에 걸린 시간(초).
    int? duration,
  }) = _WarAttack;

  factory WarAttack.fromJson(Map<String, dynamic> json) =>
      _$WarAttackFromJson(json);
}

@freezed
abstract class WarMember with _$WarMember {
  const factory WarMember({
    String? tag,
    String? name,

    // 전쟁 응답은 `townhallLevel`(소문자 h)이다. 플레이어 응답의 `townHallLevel`과 다르다.
    @JsonKey(name: 'townhallLevel') int? townHallLevel,
    int? mapPosition,

    /// 이 멤버의 기지가 공격당한 횟수.
    int? opponentAttacks,
    WarAttack? bestOpponentAttack,
    @Default(<WarAttack>[]) List<WarAttack> attacks,
  }) = _WarMember;

  factory WarMember.fromJson(Map<String, dynamic> json) =>
      _$WarMemberFromJson(json);
}

@freezed
abstract class CurrentWarClan with _$CurrentWarClan {
  const factory CurrentWarClan({
    String? tag,
    String? name,
    BadgeUrls? badgeUrls,
    int? clanLevel,
    int? attacks,
    int? stars,
    double? destructionPercentage,
    @Default(<WarMember>[]) List<WarMember> members,
  }) = _CurrentWarClan;

  factory CurrentWarClan.fromJson(Map<String, dynamic> json) =>
      _$CurrentWarClanFromJson(json);
}

@freezed
abstract class CurrentWar with _$CurrentWar {
  const factory CurrentWar({
    @JsonKey(unknownEnumValue: WarState.unknown) WarState? state,
    int? teamSize,
    int? attacksPerMember,
    String? battleModifier,
    @CocDateTimeConverter() DateTime? preparationStartTime,
    @CocDateTimeConverter() DateTime? startTime,
    @CocDateTimeConverter() DateTime? endTime,
    CurrentWarClan? clan,
    CurrentWarClan? opponent,
  }) = _CurrentWar;

  factory CurrentWar.fromJson(Map<String, dynamic> json) =>
      _$CurrentWarFromJson(json);
}
