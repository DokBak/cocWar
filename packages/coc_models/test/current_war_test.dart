import 'dart:convert';
import 'dart:io';

import 'package:coc_models/coc_models.dart';
import 'package:test/test.dart';

Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync())
        as Map<String, dynamic>;

void main() {
  group('CurrentWar', () {
    final war = CurrentWar.fromJson(fixture('currentwar_inwar'));

    test('상태와 기본 정보', () {
      expect(war.state, WarState.inWar);
      expect(war.teamSize, 2);
      expect(war.attacksPerMember, 2);
      expect(war.battleModifier, 'none');
    });

    test('시간은 UTC DateTime으로 변환된다', () {
      expect(war.preparationStartTime, DateTime.utc(2026, 10, 12, 10));
      expect(war.startTime, DateTime.utc(2026, 10, 13, 10));
      expect(war.endTime, DateTime.utc(2026, 10, 14, 10));
    });

    test('양 클랜의 점수와 멤버', () {
      expect(war.clan?.name, 'Alpha Clan');
      expect(war.clan?.stars, 5);
      expect(war.clan?.destructionPercentage, 83.5);
      expect(war.opponent?.stars, 2);
      expect(war.clan?.members, hasLength(2));
    });

    test('멤버: townhallLevel(소문자 h)을 읽고, 공격·방어 기록이 있다', () {
      final ann = war.clan!.members.first;
      expect(ann.townHallLevel, 16);
      expect(ann.mapPosition, 1);
      expect(ann.attacks, hasLength(2));
      expect(ann.attacks.first.stars, 3);
      expect(ann.attacks.first.destructionPercentage, 100); // 정수도 double로
      expect(ann.attacks.first.defenderTag, '#B2');
      expect(ann.bestOpponentAttack?.stars, 2);
      expect(ann.opponentAttacks, 1);
    });

    test('공격하지 않은 멤버는 공격 목록이 비어 있다', () {
      expect(war.clan!.members.last.attacks, isEmpty);
      expect(war.clan!.members.last.bestOpponentAttack, isNull);
    });

    test('왕복 변환', () {
      expect(CurrentWar.fromJson(war.toJson()), war);
    });
  });

  test('notInWar 응답은 state만 있다', () {
    final war = CurrentWar.fromJson(fixture('currentwar_notinwar'));
    expect(war.state, WarState.notInWar);
    expect(war.clan, isNull);
    expect(war.endTime, isNull);
  });

  test('알 수 없는 state는 unknown', () {
    expect(CurrentWar.fromJson({'state': 'brandNew'}).state, WarState.unknown);
  });

  test('모든 상태 값을 읽는다', () {
    for (final (raw, state) in [
      ('preparation', WarState.preparation),
      ('inWar', WarState.inWar),
      ('warEnded', WarState.warEnded),
      ('notInWar', WarState.notInWar),
    ]) {
      expect(CurrentWar.fromJson({'state': raw}).state, state);
    }
  });
}
