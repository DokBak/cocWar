import 'dart:convert';
import 'dart:io';

import 'package:coc_models/coc_models.dart';
import 'package:test/test.dart';

Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync())
        as Map<String, dynamic>;

void main() {
  final group = ClanWarLeagueGroup.fromJson(fixture('leaguegroup'));

  test('상태와 시즌', () {
    expect(group.state, LeagueGroupState.inWar);
    expect(group.season, '2026-11');
  });

  test('클랜과 명단', () {
    expect(group.clans, hasLength(2));
    expect(group.clans.first.name, 'Alpha Clan');
    expect(group.clans.first.members.first.townHallLevel, 16);
    expect(group.clans.last.badgeUrls, isNull);
  });

  test('라운드의 전쟁 태그, 정해지지 않은 라운드는 #0', () {
    expect(group.rounds.first.warTags, hasLength(4));
    expect(group.rounds.last.warTags, everyElement(unscheduledWarTag));
  });

  test('모르는 상태는 unknown', () {
    expect(
      ClanWarLeagueGroup.fromJson({'state': 'somethingNew'}).state,
      LeagueGroupState.unknown,
    );
  });

  test('왕복 변환', () {
    expect(ClanWarLeagueGroup.fromJson(group.toJson()), group);
  });
}
