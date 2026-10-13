import 'dart:convert';
import 'dart:io';

import 'package:coc_models/coc_models.dart';
import 'package:test/test.dart';

Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync())
        as Map<String, dynamic>;

void main() {
  group('Clan', () {
    test('파싱 및 왕복 변환', () {
      final clan = Clan.fromJson(fixture('clan'));
      expect(clan.tag, '#2PP');
      expect(clan.warWins, 120);
      expect(clan.isWarLogPublic, isTrue);
      expect(clan.warLeague?.name, 'Champion League III');
      expect(clan.capitalLeague?.id, 85000016);
      expect(clan.clanCapitalPoints, 3254);
      expect(clan.clanBuilderBasePoints, 33188);
      expect(clan.memberList.single.league?.name, 'Legend League');
      expect(clan.memberList.single.townHallLevel, 16);
      expect(clan.memberList.single.leagueTier?.name, 'Electro League 33');
      expect(clan.labels.single.name, 'Clan Wars');
      expect(Clan.fromJson(clan.toJson()), clan);
    });

    test('선택 필드가 없어도 파싱된다', () {
      final clan = Clan.fromJson({'tag': '#X'});
      expect(clan.memberList, isEmpty);
      expect(clan.warWins, isNull);
    });
  });

  group('ClanWarLog', () {
    final log = ClanWarLog.fromJson(fixture('warlog'));

    test('항목 파싱', () {
      expect(log.items, hasLength(3));
      final first = log.items.first;
      expect(first.result, WarResult.win);
      expect(first.clan?.stars, 42);
      expect(first.clan?.destructionPercentage, 96.5);
      expect(first.opponent?.tag, isNull);
      expect(log.paging?.cursors?.after, 'abc');
    });

    test('알 수 없는 result는 unknown, 없으면 null', () {
      expect(log.items[1].result, WarResult.unknown);
      expect(log.items[2].result, isNull);
    });

    test('endTime은 UTC DateTime으로 변환된다', () {
      expect(log.items.first.endTime, DateTime.utc(2024, 10, 13, 12));
    });

    test('왕복 변환', () {
      expect(ClanWarLog.fromJson(log.toJson()), log);
    });
  });

  group('Player', () {
    final player = Player.fromJson(fixture('player'));

    test('기본 정보와 영웅 장비', () {
      expect(player.townHallLevel, 16);
      expect(player.clan?.tag, '#2PP');
      expect(player.leagueTier?.name, 'Electro League 33');
      expect(player.league, isNull); // 새 리그 체계에서는 league가 비어 있을 수 있다
      expect(player.heroes.single.equipment.single.name, 'Giant Gauntlet');
    });

    test('슈퍼 부대 활성화 여부', () {
      final active = player.troops.where((t) => t.superTroopIsActive == true);
      expect(active.single.name, 'Super Barbarian');
    });

    test('왕복 변환', () {
      expect(Player.fromJson(player.toJson()), player);
    });
  });

  group('CocDateTimeConverter', () {
    const c = CocDateTimeConverter();

    test('CoC 형식 파싱 및 직렬화', () {
      final d = c.fromJson('20241013T120000.000Z');
      expect(d, DateTime.utc(2024, 10, 13, 12));
      expect(c.toJson(d), '20241013T120000.000Z');
    });

    test('밀리초 자릿수와 null 처리', () {
      expect(c.fromJson('20241013T120000.5Z')?.millisecond, 500);
      expect(c.fromJson(null), isNull);
      expect(c.toJson(null), isNull);
    });
  });

  group('normalizeTag', () {
    test('정규화', () {
      expect(normalizeTag('2pp'), '#2PP');
      expect(normalizeTag(' #2pp '), '#2PP');
      expect(normalizeTag('%232pp'), '#2PP');
      expect(normalizeTag('#2OO'), '#200');
    });

    test('유효성 검사', () {
      expect(isValidTag('#2PP0'), isTrue);
      expect(isValidTag('#ABC'), isFalse);
      expect(isValidTag('2PP'), isFalse);
    });
  });
}
