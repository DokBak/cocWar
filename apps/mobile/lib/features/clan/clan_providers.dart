import 'package:coc_models/coc_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';

/// 화면에 한 번에 보여주는 전쟁 로그 개수.
const warLogPageSize = 10;

final clanProvider = FutureProvider.autoDispose.family<Clan, String>(
  (ref, tag) => ref.watch(apiClientProvider).getClan(tag),
);

/// 결과가 없고 1인당 공격이 1회인 항목은 클랜전 리그(CWL) 기록이다.
/// CWL은 상대 클랜 정보가 없어 이 목록에서는 다루지 않고, 별도 화면에서 보여줄 예정이다.
bool isCwl(ClanWarLogEntry e) =>
    e.result == null && (e.attacksPerMember ?? 1) == 1;

/// 일반 클랜전 로그 전체(CWL 제외). 서버가 5분간 캐시하므로 페이지를 넘길 때 다시 요청하지 않는다.
final warLogProvider = FutureProvider.autoDispose
    .family<List<ClanWarLogEntry>, String>((ref, tag) async {
      final log = await ref.watch(apiClientProvider).getWarLog(tag);
      return log.items.where((e) => !isCwl(e)).toList();
    });
