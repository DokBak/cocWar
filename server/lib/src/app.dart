import 'dart:convert';

import 'package:coc_models/coc_models.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'coc_api_client.dart';
import 'ttl_cache.dart';

const _json = {'content-type': 'application/json; charset=utf-8'};

Response _error(int status, String reason, String message) => Response(
  status,
  body: jsonEncode({'reason': reason, 'message': message}),
  headers: _json,
);

/// 프록시 서버의 요청 핸들러를 만든다.
Handler buildHandler(
  CocApiClient api, {
  TtlCache<Map<String, dynamic>>? cache,
  void Function(String message)? log,
}) {
  final store = cache ?? TtlCache<Map<String, dynamic>>();
  final warn = log ?? (_) {};

  Future<Response> cached(
    Request req,
    String tag,
    String name,
    Duration ttl,
    Future<Map<String, dynamic>> Function(String tag) load,
  ) async {
    final normalized = normalizeTag(tag);
    if (!isValidTag(normalized)) {
      return _error(400, 'badRequest', '올바르지 않은 태그입니다: $tag');
    }
    final key = '$name|$normalized|${req.url.query}';
    var data = store.get(key);
    if (data == null) {
      try {
        data = await load(normalized);
      } on CocApiException catch (e) {
        return _fromUpstream(e, warn);
      }
      store.set(key, data, ttl);
    }
    return Response.ok(
      jsonEncode(data),
      headers: {..._json, 'cache-control': 'public, max-age=${ttl.inSeconds}'},
    );
  }

  final router = Router()
    ..get('/health', (Request _) => Response.ok('ok'))
    ..get(
      '/clans/<tag>',
      (Request r, String tag) =>
          cached(r, tag, 'clan', const Duration(minutes: 2), api.getClan),
    )
    ..get(
      '/clans/<tag>/warlog',
      (Request r, String tag) => cached(
        r,
        tag,
        'warlog',
        const Duration(minutes: 5),
        (t) => api.getWarLog(
          t,
          limit: int.tryParse(r.url.queryParameters['limit'] ?? ''),
          after: r.url.queryParameters['after'],
          before: r.url.queryParameters['before'],
        ),
      ),
    )
    ..get(
      '/clans/<tag>/currentwar',
      (Request r, String tag) => cached(
        r,
        tag,
        'currentwar',
        const Duration(minutes: 1),
        api.getCurrentWar,
      ),
    )
    ..get(
      '/clans/<tag>/capitalraidseasons',
      (Request r, String tag) => cached(
        r,
        tag,
        'capitalraid',
        // 레이드 주말에는 공격이 계속 쌓이므로 짧게 캐시한다.
        const Duration(minutes: 2),
        (t) => api.getCapitalRaidSeasons(
          t,
          limit: int.tryParse(r.url.queryParameters['limit'] ?? ''),
        ),
      ),
    )
    ..get('/leagues', (Request r) async {
      // 리그 목록은 거의 바뀌지 않으므로 하루 동안 캐시한다.
      const ttl = Duration(hours: 24);
      var data = store.get('leagues');
      if (data == null) {
        try {
          data = await api.getLeagues();
        } on CocApiException catch (e) {
          return _fromUpstream(e, warn);
        }
        store.set('leagues', data, ttl);
      }
      return Response.ok(
        jsonEncode(data),
        headers: {
          ..._json,
          'cache-control': 'public, max-age=${ttl.inSeconds}',
        },
      );
    })
    ..get(
      '/players/<tag>',
      (Request r, String tag) =>
          cached(r, tag, 'player', const Duration(minutes: 2), api.getPlayer),
    );

  return const Pipeline()
      .addMiddleware(_cors)
      .addMiddleware(_catchAll(warn))
      .addHandler(router.call);
}

/// 업스트림 오류를 앱이 구분할 수 있는 상태 코드로 매핑한다.
Response _fromUpstream(CocApiException e, void Function(String) warn) {
  switch (e.statusCode) {
    case 403 when e.reason == 'accessDenied':
      // 비공개 전쟁 로그 등 클랜/플레이어 쪽 사유.
      return _error(403, 'accessDenied', e.message ?? '접근이 거부되었습니다.');
    case 403:
      // accessDenied.invalidIp 등 서버 설정 문제는 클라이언트 잘못이 아니다.
      warn('CoC API 인증 실패: $e');
      return _error(502, 'upstreamAuth', '서버의 API 키 설정에 문제가 있습니다.');
    case 400:
      return _error(400, e.reason ?? 'badRequest', e.message ?? '잘못된 요청입니다.');
    case 404:
      return _error(404, 'notFound', e.message ?? '찾을 수 없습니다.');
    case 429:
      return _error(429, 'rateLimited', '요청이 너무 많습니다. 잠시 후 다시 시도하세요.');
    case 503:
      return _error(503, 'inMaintenance', 'Clash of Clans API가 점검 중입니다.');
    default:
      warn('CoC API 예상 밖 응답: $e');
      return _error(502, 'upstreamError', 'CoC API 호출에 실패했습니다.');
  }
}

Middleware _catchAll(void Function(String) warn) =>
    (inner) => (req) async {
      try {
        return await inner(req);
      } catch (e, st) {
        warn('처리되지 않은 오류: $e\n$st');
        return _error(500, 'internalError', '서버 오류가 발생했습니다.');
      }
    };

/// 웹 앱에서 호출할 수 있도록 GET/OPTIONS에 CORS 헤더를 붙인다.
Response _corsHeaders(Response r) => r.change(
  headers: {
    'access-control-allow-origin': '*',
    'access-control-allow-methods': 'GET, OPTIONS',
    'access-control-allow-headers': 'content-type',
  },
);

Handler _cors(Handler inner) => (req) async {
  if (req.method == 'OPTIONS') return _corsHeaders(Response.ok(''));
  return _corsHeaders(await inner(req));
};
