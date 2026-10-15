import 'package:coc_models/coc_models.dart';
import 'package:dio/dio.dart';

/// 서버가 돌려준 오류를 화면에서 구분해서 보여주기 위한 종류.
enum ApiErrorKind {
  invalidTag,
  notFound,
  privateLog,
  rateLimited,
  maintenance,
  network,
  unknown,
}

class ApiException implements Exception {
  const ApiException(this.kind, {this.statusCode, this.message});

  final ApiErrorKind kind;
  final int? statusCode;
  final String? message;

  @override
  String toString() => 'ApiException($kind, $statusCode, $message)';
}

/// 우리 프록시 서버만 호출한다. CoC API 토큰은 서버에만 있다.
class ApiClient {
  ApiClient({required String baseUrl, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 20),
            ),
          );

  final Dio _dio;

  Future<Clan> getClan(String tag) async =>
      Clan.fromJson(await _get('/clans/${_enc(tag)}'));

  Future<ClanWarLog> getWarLog(String tag, {int? limit, String? after}) async =>
      ClanWarLog.fromJson(
        await _get(
          '/clans/${_enc(tag)}/warlog',
          query: {'limit': ?limit, 'after': ?after},
        ),
      );

  /// 진행 중이거나 막 끝난 클랜전. 전쟁 중이 아니면 `state`만 `notInWar`로 온다.
  Future<CurrentWar> getCurrentWar(String tag) async =>
      CurrentWar.fromJson(await _get('/clans/${_enc(tag)}/currentwar'));

  /// 캐피탈 레이드 시즌 목록(최근 시즌부터). 멤버별 공격 수는 최근 시즌에만 들어 있다.
  Future<CapitalRaidSeasons> getCapitalRaidSeasons(
    String tag, {
    int? limit,
  }) async => CapitalRaidSeasons.fromJson(
    await _get(
      '/clans/${_enc(tag)}/capitalraidseasons',
      query: {'limit': ?limit},
    ),
  );

  /// 리그 목록(아이콘 주소 포함). 클랜전 리그는 이름이 같은 이 목록의 아이콘을 쓴다.
  Future<List<League>> getLeagues() async {
    final data = await _get('/leagues');
    return [
      for (final item in (data['items'] as List? ?? const []))
        League.fromJson(item as Map<String, dynamic>),
    ];
  }

  Future<Player> getPlayer(String tag) async =>
      Player.fromJson(await _get('/players/${_enc(tag)}'));

  static String _enc(String tag) => Uri.encodeComponent(normalizeTag(tag));

  Future<Map<String, dynamic>> _get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: query,
      );
      return res.data ?? const {};
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  ApiException _map(DioException e) {
    final status = e.response?.statusCode;
    if (status == null) {
      return ApiException(ApiErrorKind.network, message: e.message);
    }
    final data = e.response?.data;
    final reason = data is Map ? data['reason'] as String? : null;
    final message = data is Map ? data['message'] as String? : null;
    final kind = switch (status) {
      400 => ApiErrorKind.invalidTag,
      403 when reason == 'accessDenied' => ApiErrorKind.privateLog,
      404 => ApiErrorKind.notFound,
      429 => ApiErrorKind.rateLimited,
      503 => ApiErrorKind.maintenance,
      _ => ApiErrorKind.unknown,
    };
    return ApiException(kind, statusCode: status, message: message);
  }
}
