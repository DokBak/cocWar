import 'dart:io';

/// `.env` 파일(`KEY=VALUE` 줄)을 읽어 Map으로 돌려준다. 파일이 없으면 빈 Map.
Map<String, String> loadDotEnv(String path) {
  final file = File(path);
  if (!file.existsSync()) return {};
  final result = <String, String>{};
  for (final raw in file.readAsLinesSync()) {
    final line = raw.trim();
    if (line.isEmpty || line.startsWith('#')) continue;
    final i = line.indexOf('=');
    if (i <= 0) continue;
    result[line.substring(0, i).trim()] = line.substring(i + 1).trim();
  }
  return result;
}
