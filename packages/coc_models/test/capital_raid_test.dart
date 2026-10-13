import 'dart:convert';
import 'dart:io';

import 'package:coc_models/coc_models.dart';
import 'package:test/test.dart';

Map<String, dynamic> fixture() =>
    jsonDecode(File('test/fixtures/capital_raid.json').readAsStringSync())
        as Map<String, dynamic>;

void main() {
  final seasons = CapitalRaidSeasons.fromJson(fixture());

  test('시즌 목록과 최근 시즌 요약', () {
    expect(seasons.items, hasLength(2));
    final latest = seasons.items.first;
    expect(latest.state, RaidState.ended);
    expect(latest.startTime, DateTime.utc(2026, 10, 9, 7));
    expect(latest.endTime, DateTime.utc(2026, 10, 12, 7));
    expect(latest.totalAttacks, 12);
    expect(latest.raidsCompleted, 3);
    expect(latest.capitalTotalLoot, 150000);
    expect(seasons.paging?.cursors?.after, 'abc');
  });

  test('멤버의 공격 수와 한도', () {
    final ann = seasons.items.first.members.first;
    expect(ann.tag, '#A1');
    expect(ann.attacks, 6);
    expect(ann.attackLimit, 5);
    expect(ann.bonusAttackLimit, 1);
    expect(seasons.items.first.members.last.bonusAttackLimit, 0);
  });

  test('과거 시즌은 members가 없어 빈 목록', () {
    expect(seasons.items.last.members, isEmpty);
  });

  test('attackLog 같은 아직 읽지 않는 필드가 있어도 파싱된다', () {
    expect(seasons.items.first.members, hasLength(2));
  });

  test('알 수 없는 state는 unknown', () {
    expect(
      CapitalRaidSeason.fromJson({'state': 'brandNew'}).state,
      RaidState.unknown,
    );
  });

  test('ongoing 상태', () {
    expect(
      CapitalRaidSeason.fromJson({'state': 'ongoing'}).state,
      RaidState.ongoing,
    );
  });

  test('빈 응답', () {
    final empty = CapitalRaidSeasons.fromJson({});
    expect(empty.items, isEmpty);
  });

  test('왕복 변환', () {
    expect(CapitalRaidSeasons.fromJson(seasons.toJson()), seasons);
  });
}
