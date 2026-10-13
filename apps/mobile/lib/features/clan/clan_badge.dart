import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';

/// 클랜 배지. 이미지를 못 불러오면 방패 아이콘으로 대신한다.
class ClanBadge extends StatelessWidget {
  const ClanBadge({super.key, required this.urls, this.size = 40});

  final BadgeUrls? urls;
  final double size;

  @override
  Widget build(BuildContext context) {
    final url = size > 48 ? (urls?.medium ?? urls?.small) : urls?.small;
    final fallback = Icon(Icons.shield_outlined, size: size * 0.8);
    return SizedBox(
      width: size,
      height: size,
      child: url == null
          ? fallback
          : Image.network(
              url,
              fit: BoxFit.contain,
              // 웹에서 CORS로 막혀도 <img> 태그로 대신 그린다.
              webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
              errorBuilder: (_, _, _) => fallback,
            ),
    );
  }
}
