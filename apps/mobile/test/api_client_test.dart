import 'dart:convert';

import 'package:cocwar_mobile/core/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

/// 요청을 기록하고 미리 정한 응답을 돌려주는 가짜 어댑터.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.status, this.body);

  final int status;
  final Object body;
  final paths = <String>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    paths.add(options.uri.toString());
    return ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

ApiClient clientWith(HttpClientAdapter adapter) => ApiClient(
  baseUrl: 'http://server',
  dio: Dio(BaseOptions(baseUrl: 'http://server'))..httpClientAdapter = adapter,
);

void main() {
  test('클랜 조회: 태그를 인코딩하고 모델로 변환한다', () async {
    final adapter = _FakeAdapter(200, {'tag': '#2PP', 'name': 'Test'});
    final clan = await clientWith(adapter).getClan('2pp');
    expect(clan.name, 'Test');
    expect(adapter.paths.single, 'http://server/clans/%232PP');
  });

  test('전쟁 로그: limit/after 쿼리를 전달한다', () async {
    final adapter = _FakeAdapter(200, {'items': []});
    await clientWith(adapter).getWarLog('#2PP', limit: 5, after: 'x');
    expect(adapter.paths.single, contains('limit=5'));
    expect(adapter.paths.single, contains('after=x'));
  });

  group('오류 매핑', () {
    Future<ApiException> fail(int status, [String? reason]) async {
      final adapter = _FakeAdapter(status, {'reason': ?reason, 'message': 'm'});
      try {
        await clientWith(adapter).getPlayer('#2PP');
      } on ApiException catch (e) {
        return e;
      }
      throw StateError('예외가 발생해야 합니다');
    }

    test(
      '400',
      () async => expect((await fail(400)).kind, ApiErrorKind.invalidTag),
    );
    test(
      '403 accessDenied',
      () async => expect(
        (await fail(403, 'accessDenied')).kind,
        ApiErrorKind.privateLog,
      ),
    );
    test(
      '403 기타',
      () async => expect((await fail(403)).kind, ApiErrorKind.unknown),
    );
    test(
      '404',
      () async => expect((await fail(404)).kind, ApiErrorKind.notFound),
    );
    test(
      '429',
      () async => expect((await fail(429)).kind, ApiErrorKind.rateLimited),
    );
    test(
      '503',
      () async => expect((await fail(503)).kind, ApiErrorKind.maintenance),
    );
    test(
      '502',
      () async => expect((await fail(502)).kind, ApiErrorKind.unknown),
    );
  });
}
