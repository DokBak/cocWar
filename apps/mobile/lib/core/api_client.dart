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
