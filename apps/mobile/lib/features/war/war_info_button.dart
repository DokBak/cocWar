import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import 'crossed_swords_icon.dart';
import 'war_providers.dart';

const _pillBackground = Color(0xFF2A2A31);

/// 창 아래 가운데에 떠 있는 "클랜전 정보 보기" 알약 버튼.
///
/// 클랜이 **준비일 또는 전투일**일 때만 나타나고, 누르면 클랜전 화면으로 이동한다.
/// Stack의 자식으로 쓰며, 버튼이 없을 때나 버튼 밖의 영역은 아래 화면의 터치를 막지 않는다.
class WarInfoButton extends ConsumerWidget {
  const WarInfoButton({super.key, required this.clanTag});

  final String clanTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final war = ref.watch(ongoingWarProvider(clanTag)).value;
    if (war == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final state = war.state == WarState.inWar
        ? l10n.warStateInWar
        : l10n.warStatePreparation;
    final path = '/clan/${clanTag.replaceFirst('#', '')}/war';

    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Semantics(
            button: true,
            label: '${l10n.warInfoButton} · $state',
            child: Material(
              color: _pillBackground,
              elevation: 6,
              shape: const StadiumBorder(),
              child: InkWell(
                customBorder: const StadiumBorder(),
                onTap: () => context.push(path),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CrossedSwordsIcon(size: 26, color: Colors.white),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          l10n.warInfoButton,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        state,
                        style: TextStyle(
                          color: war.state == WarState.inWar
                              ? const Color(0xFFFF8A80)
                              : const Color(0xFF90CAF9),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
