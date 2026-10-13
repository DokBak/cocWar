import 'dart:io';

import 'package:server/src/app.dart';
import 'package:server/src/coc_api_client.dart';
import 'package:server/src/env.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

Future<void> main(List<String> args) async {
  // 환경변수가 우선이고, 없으면 개발용 .env 파일을 사용한다.
  final env = {...loadDotEnv('.env'), ...Platform.environment};
  final token = env['COC_API_TOKEN'];
  if (token == null || token.isEmpty) {
    stderr.writeln('COC_API_TOKEN 환경변수(또는 .env)가 필요합니다.');
    exit(64);
  }

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(
        buildHandler(
          HttpCocApiClient(token: token),
          log: (m) => stderr.writeln(m),
        ),
      );

  final port = int.parse(env['PORT'] ?? '8080');
  final server = await serve(handler, InternetAddress.anyIPv4, port);
  print('Server listening on port ${server.port}');
}
