import 'package:flutter/material.dart';

import '../../core/saved_tag.dart';
import '../../l10n/app_localizations.dart';
import '../favorite_button.dart';
import '../language_button.dart';

/// Phase 5에서 플레이어 프로필 화면으로 채운다.
class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(tag),
      actions: [
        const LanguageButton(),
        FavoriteButton(tag: SavedTag(TagKind.player, tag)),
      ],
    ),
    body: Center(child: Text(AppLocalizations.of(context).comingSoon)),
  );
}
