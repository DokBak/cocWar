import 'package:coc_models/coc_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';

/// 클랜전 상세 화면용. 오류(비공개 로그 등)는 그대로 전달한다.
final currentWarProvider = FutureProvider.autoDispose
    .family<CurrentWar, String>(
      (ref, tag) => ref.watch(apiClientProvider).getCurrentWar(tag),
    );

/// "클랜전 정보 보기" 버튼용. **준비일·전투일일 때만** 전쟁을 돌려준다.
///
/// 전쟁이 없거나(`notInWar`) 이미 끝났거나(`warEnded`, 지난 전쟁은 전쟁 로그에 있다),
/// 오류가 나면(전쟁 로그 비공개 403 등) null이다. 버튼은 보조 기능이라 오류를 화면에 띄우지 않는다.
final ongoingWarProvider = FutureProvider.autoDispose
    .family<CurrentWar?, String>((ref, tag) async {
      try {
        final war = await ref.watch(currentWarProvider(tag).future);
        return isOngoing(war) ? war : null;
      } catch (_) {
        return null;
      }
    });

/// 준비일 또는 전투일인지.
bool isOngoing(CurrentWar war) =>
    war.state == WarState.preparation || war.state == WarState.inWar;

/// 현재 시각. 남은 시간 계산에 쓰며, 테스트에서 고정된 시각으로 바꾼다.
final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);
