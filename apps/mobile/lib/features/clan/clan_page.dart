import 'package:flutter/material.dart';

import '../../core/saved_tag.dart';
import '../../l10n/app_localizations.dart';
import '../favorite_button.dart';

/// Phase 4에서 전쟁 로그 화면으로 채운다.
class ClanPage extends StatelessWidget {
  const ClanPage({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(tag),
      actions: [FavoriteButton(tag: SavedTag(TagKind.clan, tag))],
    ),
    body: Center(child: Text(AppLocalizations.of(context).comingSoon)),
  );
}
