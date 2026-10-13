import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/clan/capital_raid_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_api.dart';

const _season = CapitalRaidSeason(
  state: RaidState.ended,
  totalAttacks: 8,
  members: [
    CapitalRaidMember(
      tag: '#A1',
      name: 'Ann',
      attacks: 6,
      attackLimit: 5,
      bonusAttackLimit: 1,
    ),
    CapitalRaidMember(
      tag: '#A2',
      name: 'Bo',
      attacks: 2,
      attackLimit: 5,
      bonusAttackLimit: 0,
    ),
  ],
);

void main() {
  group('raidUsage', () {
    test('전체 공격권은 기본 한도 + 보너스 한도', () {
      expect(raidUsage(_season, '#A1'), const RaidUsage(6, 6));
      expect(raidUsage(_season, '#A1').toString(), '6/6');
    });

    test('보너스가 없으면 기본 한도만', () {
      expect(raidUsage(_season, '#A2'), const RaidUsage(2, 5));
    });

    test('레이드 멤버 목록에 없는 클랜원은 공격하지 않은 것: 0/5', () {
      expect(raidUsage(_season, '#NOBODY'), const RaidUsage(0, 5));
      expect(raidUsage(_season, null), const RaidUsage(0, 5));
    });

    test('모두 사용 / 하나도 사용하지 않음 / 일부', () {
      expect(raidUsage(_season, '#A1').complete, isTrue);
      expect(raidUsage(_season, '#A1').none, isFalse);
      expect(raidUsage(_season, '#A2').complete, isFalse);
      expect(raidUsage(_season, '#A2').none, isFalse);
      expect(raidUsage(_season, '#NOBODY').none, isTrue);
    });

    test('값이 비어 있어도 기본 한도로 계산한다', () {
      const season = CapitalRaidSeason(members: [CapitalRaidMember(tag: '#A')]);
      expect(raidUsage(season, '#A'), const RaidUsage(0, 5));
    });
  });

  group('raidMembersAvailable', () {
    test('멤버 목록이 있으면 믿을 수 있다', () {
      expect(raidMembersAvailable(_season), isTrue);
    });

    test('공격 기록은 있는데 멤버 목록이 비어 있으면(과거 시즌) 쓰지 않는다', () {
      expect(
        raidMembersAvailable(const CapitalRaidSeason(totalAttacks: 126)),
        isFalse,
      );
    });

    test('아직 공격이 없는 시즌은 비어 있어도 정상이다', () {
      expect(
        raidMembersAvailable(const CapitalRaidSeason(totalAttacks: 0)),
        isTrue,
      );
      expect(raidMembersAvailable(const CapitalRaidSeason()), isTrue);
    });
  });

  group('latestRaidProvider', () {
    Future<CapitalRaidSeason?> latest(FakeApi api) async {
      final container = ProviderContainer(
        retry: noAutoRetry,
        overrides: [apiClientProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      return container.read(latestRaidProvider('#2PP').future);
    }

    test('가장 최근 시즌 한 건만 요청해서 첫 항목을 돌려준다', () async {
      final api = FakeApi()
        ..raid = const CapitalRaidSeasons(
          items: [_season, CapitalRaidSeason(totalAttacks: 100)],
        );
      final season = await latest(api);
      expect(season?.members, hasLength(2));
      expect(api.raidLimit, 1);
    });

    test('시즌이 없으면 null', () async {
      expect(
        await latest(FakeApi()..raid = const CapitalRaidSeasons()),
        isNull,
      );
    });

    test('오류(비공개 등)는 null이고 예외를 던지지 않으며 한 번만 요청한다', () async {
      final api = FakeApi()
        ..raidError = const ApiException(
          ApiErrorKind.privateLog,
          statusCode: 403,
        );
      expect(await latest(api), isNull);
      expect(api.raidCalls, 1);
    });
  });
}
