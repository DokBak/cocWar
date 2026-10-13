import 'package:flutter/material.dart';

/// 네트워크 이미지. 못 불러오면 [fallback] 아이콘으로 대신한다.
class RemoteImage extends StatelessWidget {
  const RemoteImage({
    super.key,
    required this.url,
    this.size = 40,
    this.fallback = Icons.shield_outlined,
  });

  final String? url;
  final double size;
  final IconData fallback;

  @override
  Widget build(BuildContext context) {
    final icon = Icon(fallback, size: size * 0.8);
    return SizedBox(
      width: size,
      height: size,
      child: url == null
          ? icon
          : Image.network(
              url!,
              fit: BoxFit.contain,
              // 웹에서 CORS로 막혀도 <img> 태그로 대신 그린다.
              webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
              errorBuilder: (_, _, _) => icon,
            ),
    );
  }
}
