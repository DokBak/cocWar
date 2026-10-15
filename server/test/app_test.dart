import 'dart:convert';

import 'package:server/src/app.dart';
import 'package:server/src/coc_api_client.dart';
import 'package:server/src/ttl_cache.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

class FakeApi implements CocApiClient {
  final calls = <String>[];
  CocApiException? error;

  Future<Map<String, dynamic>> _ok(
    String call,
    Map<String, dynamic> body,
  ) async {
    calls.add(call);
    if (error != null) throw error!;
    return body;
  }

  @override
  Future<Map<String, dynamic>> getClan(String tag) =>
      _ok('clan $tag', {'tag': tag, 'name': 'Test'});

  @override
  Future<Map<String, dynamic>> getWarLog(
    String tag, {
    int? limit,
    String? after,
    String? before,
  }) => _ok('warlog $tag limit=$limit after=$after', {'items': []});

  @override
  Future<Map<String, dynamic>> getCurrentWar(String tag) =>
      _ok('currentwar $tag', {'state': 'notInWar'});

  @override
  Future<Map<String, dynamic>> getCapitalRaidSeasons(
    String tag, {
    int? limit,
  }) => _ok('capitalraid $tag limit=$limit', {'items': []});

  @override
  Future<Map<String, dynamic>> getLeagues() => _ok('leagues', {
    'items': [
      {'id': 1, 'name': 'Bronze League III'},
    ],
  });

  @override
  Future<Map<String, dynamic>> getPlayer(String tag) =>
      _ok('player $tag', {'tag': tag});
}

void main() {
  late FakeApi api;
  late Handler handler;
  final logs = <String>[];

  setUp(() {
    api = FakeApi();
    logs.clear();
    handler = buildHandler(api, log: logs.add);
  });

  Future<Response> get(String path) =>
      Future.sync(() => handler(Request('GET', Uri.parse('http://x$path'))));

  Future<Map<String, dynamic>> json(Response r) async =>
      jsonDecode(await r.readAsString()) as Map<String, dynamic>;

  test('/health', () async {
    expect((await get('/health')).statusCode, 200);
  });

  test('클랜 조회: 태그를 정규화해서 업스트림에 전달한다', () async {
    final res = await get('/clans/%232pp');
    expect(res.statusCode, 200);
    expect((await json(res))['tag'], '#2PP');
    expect(api.calls, ['clan #2PP']);
  });

  test('# 없이 소문자로 입력해도 동작한다', () async {
    expect((await get('/players/2pp')).statusCode, 200);
    expect(api.calls, ['player #2PP']);
  });

  test('잘못된 태그는 400이고 업스트림을 호출하지 않는다', () async {
    final res = await get('/clans/%23ABC');
    expect(res.statusCode, 400);
    expect((await json(res))['reason'], 'badRequest');
    expect(api.calls, isEmpty);
  });

  test('전쟁 로그: limit/after 쿼리를 전달한다', () async {
    await get('/clans/%232PP/warlog?limit=10&after=abc');
    expect(api.calls, ['warlog #2PP limit=10 after=abc']);
  });

  test('캐피탈 레이드: 태그를 정규화하고 limit을 전달한다', () async {
    final res = await get('/clans/%232pp/capitalraidseasons?limit=1');
    expect(res.statusCode, 200);
    expect(api.calls, ['capitalraid #2PP limit=1']);
  });

  test('캐피탈 레이드: 같은 요청은 캐시된다', () async {
    await get('/clans/%232PP/capitalraidseasons?limit=1');
    await get('/clans/%232PP/capitalraidseasons?limit=1');
    expect(api.calls, hasLength(1));
  });

  test('캐피탈 레이드: 잘못된 태그는 400이고 업스트림을 호출하지 않는다', () async {
    final res = await get('/clans/%23ABC/capitalraidseasons');
    expect(res.statusCode, 400);
    expect(api.calls, isEmpty);
  });

  test('캐피탈 레이드: 전쟁 로그 비공개(403 accessDenied)는 403으로 전달한다', () async {
    api.error = CocApiException(403, reason: 'accessDenied');
    final res = await get('/clans/%232PP/capitalraidseasons');
    expect(res.statusCode, 403);
  });

  test('리그 목록: 그대로 전달하고 하루 캐시 헤더를 붙인다', () async {
    final res = await get('/leagues');
    expect(res.statusCode, 200);
    expect((await json(res))['items'], isNotEmpty);
    expect(res.headers['cache-control'], 'public, max-age=86400');
  });

  test('리그 목록: 두 번째 요청은 캐시에서 응답한다', () async {
    await get('/leagues');
    await get('/leagues');
    expect(api.calls, ['leagues']);
  });

  test('리그 목록: 업스트림 오류는 매핑해서 전달하고 캐시하지 않는다', () async {
    api.error = CocApiException(503, reason: 'inMaintenance');
    expect((await get('/leagues')).statusCode, 503);
    api.error = null;
    expect((await get('/leagues')).statusCode, 200);
    expect(api.calls, hasLength(2));
  });

  test('같은 요청은 캐시되고 쿼리가 다르면 따로 저장된다', () async {
    await get('/clans/%232PP/warlog?limit=10');
    await get('/clans/%232PP/warlog?limit=10');
    await get('/clans/%232PP/warlog?limit=20');
    expect(api.calls, hasLength(2));
  });

  test('오류 응답은 캐시하지 않는다', () async {
    api.error = CocApiException(503, reason: 'inMaintenance');
    expect((await get('/players/%232PP')).statusCode, 503);
    api.error = null;
    expect((await get('/players/%232PP')).statusCode, 200);
    expect(api.calls, hasLength(2));
  });

  group('업스트림 오류 매핑', () {
    Future<void> expectMapped(
      CocApiException e,
      int status,
      String reason,
    ) async {
      api.error = e;
      final res = await get('/clans/%232PP/warlog');
      expect(res.statusCode, status);
      expect((await json(res))['reason'], reason);
    }

    test(
      '비공개 전쟁 로그',
      () => expectMapped(
        CocApiException(403, reason: 'accessDenied', message: 'private'),
        403,
        'accessDenied',
      ),
    );

    test('IP 불일치는 502로 바꾸고 로그를 남긴다', () async {
      await expectMapped(
        CocApiException(403, reason: 'accessDenied.invalidIp'),
        502,
        'upstreamAuth',
      );
      expect(logs, isNotEmpty);
    });

    test('404', () => expectMapped(CocApiException(404), 404, 'notFound'));
    test('429', () => expectMapped(CocApiException(429), 429, 'rateLimited'));
    test(
      '점검 중',
      () => expectMapped(CocApiException(503), 503, 'inMaintenance'),
    );
    test('그 외', () => expectMapped(CocApiException(500), 502, 'upstreamError'));
  });

  test('예기치 못한 예외는 500 JSON으로 응답한다', () async {
    final broken = buildHandler(_Throwing(), log: logs.add);
    final res = await broken(
      Request('GET', Uri.parse('http://x/clans/%232PP')),
    );
    expect(res.statusCode, 500);
  });

  test('CORS 헤더와 OPTIONS 프리플라이트', () async {
    final res = await get('/health');
    expect(res.headers['access-control-allow-origin'], '*');
    final pre = await handler(
      Request('OPTIONS', Uri.parse('http://x/clans/%232PP')),
    );
    expect(pre.statusCode, 200);
  });

  test('TtlCache: 만료와 용량 제한', () {
    var now = DateTime(2026);
    final c = TtlCache<int>(maxEntries: 2, now: () => now);
    c.set('a', 1, const Duration(seconds: 10));
    expect(c.get('a'), 1);
    now = now.add(const Duration(seconds: 11));
    expect(c.get('a'), isNull);
    c.set('b', 2, const Duration(minutes: 1));
    c.set('c', 3, const Duration(minutes: 1));
    c.set('d', 4, const Duration(minutes: 1));
    expect(c.get('b'), isNull);
    expect(c.get('d'), 4);
  });
}

class _Throwing extends FakeApi {
  @override
  Future<Map<String, dynamic>> getClan(String tag) => throw StateError('boom');
}
