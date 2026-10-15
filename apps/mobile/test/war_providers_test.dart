import 'package:coc_models/coc_models.dart';
import 'package:cocwar_mobile/core/api_client.dart';
import 'package:cocwar_mobile/core/providers.dart';
import 'package:cocwar_mobile/features/war/war_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_api.dart';
import 'support/war_fixture.dart';

void main() {
  Future<CurrentWar?> ongoing(FakeApi api) async {
    final container = ProviderContainer(
      retry: noAutoRetry,
      overrides: [apiClientProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    return container.read(ongoingWarProvider('#2PP').future);
  }

  group('ongoingWarProvider: 진행 중인 전쟁만 돌려준다', () {
    test('준비일', () async {
      final api = FakeApi()..war = makeWar(state: WarState.preparation);
      expect((await ongoing(api))?.state, WarState.preparation);
    });

    test('전투일', () async {
      final api = FakeApi()..war = makeWar();
      expect((await ongoing(api))?.state, WarState.inWar);
    });

    test('종료된 전쟁은 null (지난 전쟁은 전쟁 로그에 있다)', () async {
      final api = FakeApi()..war = makeWar(state: WarState.warEnded);
      expect(await ongoing(api), isNull);
    });

    test('전쟁 중이 아니면 null', () async {
      final api = FakeApi()..war = const CurrentWar(state: WarState.notInWar);
      expect(await ongoing(api), isNull);
    });

    test('알 수 없는 상태는 null', () async {
      final api = FakeApi()..war = const CurrentWar(state: WarState.unknown);
      expect(await ongoing(api), isNull);
    });

    test('오류(전쟁 로그 비공개 403 등)는 null이고 예외를 던지지 않는다', () async {
      final api = FakeApi()
        ..warError = const ApiException(
          ApiErrorKind.privateLog,
          statusCode: 403,
        );
      expect(await ongoing(api), isNull);
      expect(api.warCalls, 1);
    });
  });

  test('currentWarProvider는 오류를 그대로 전달한다 (상세 화면에서 보여주기 위해)', () async {
    final api = FakeApi()
      ..warError = const ApiException(
        ApiErrorKind.maintenance,
        statusCode: 503,
      );
    final container = ProviderContainer(
      retry: noAutoRetry,
      overrides: [apiClientProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    // 화면이 구독하는 것처럼 구독을 유지한다(autoDispose가 로딩 중에 해제하지 않도록).
    final sub = container.listen(currentWarProvider('#2PP'), (_, _) {});
    addTearDown(sub.close);
    await expectLater(
      container.read(currentWarProvider('#2PP').future),
      throwsA(isA<ApiException>()),
    );
    // 자동 재시도를 끄지 않으면 같은 요청이 최대 11번 나간다.
    expect(api.warCalls, 1);
  });

  test('noAutoRetry는 어떤 오류에도 재시도하지 않는다', () {
    expect(noAutoRetry(0, const ApiException(ApiErrorKind.network)), isNull);
    expect(noAutoRetry(3, Exception('x')), isNull);
  });

  test('isOngoing', () {
    expect(isOngoing(makeWar(state: WarState.preparation)), isTrue);
    expect(isOngoing(makeWar()), isTrue);
    expect(isOngoing(makeWar(state: WarState.warEnded)), isFalse);
    expect(isOngoing(const CurrentWar()), isFalse);
  });
}
