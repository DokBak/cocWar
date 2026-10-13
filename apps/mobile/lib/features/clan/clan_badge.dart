import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';

import '../remote_image.dart';

/// 클랜 배지. 이미지를 못 불러오면 방패 아이콘으로 대신한다.
class ClanBadge extends StatelessWidget {
  const ClanBadge({super.key, required this.urls, this.size = 40});

  final BadgeUrls? urls;
  final double size;

  @override
  Widget build(BuildContext context) => RemoteImage(
    url: size > 48 ? (urls?.medium ?? urls?.small) : urls?.small,
    size: size,
  );
}
