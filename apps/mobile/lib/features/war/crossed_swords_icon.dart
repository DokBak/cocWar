import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 교차한 칼 아이콘. Material 아이콘에는 칼 모양이 없어 직접 그린다.
class CrossedSwordsIcon extends StatelessWidget {
  const CrossedSwordsIcon({super.key, this.size = 24, this.color});

  final double size;

  /// 기본은 현재 아이콘 색.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? IconTheme.of(context).color ?? Colors.white;
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _SwordsPainter(c)),
    );
  }
}

class _SwordsPainter extends CustomPainter {
  _SwordsPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final blade = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = s * 0.14;
    final guard = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = s * 0.1;

    // 칼 하나: 왼쪽 위에서 오른쪽 아래로. 칼날 + 손잡이 쪽 가드.
    void sword(bool mirrored) {
      canvas.save();
      canvas.translate(s / 2, s / 2);
      if (mirrored) canvas.scale(-1, 1);
      canvas.rotate(math.pi / 4);
      // 칼날(위쪽)과 손잡이(아래쪽)
      canvas.drawLine(Offset(0, -s * 0.46), Offset(0, s * 0.18), blade);
      canvas.drawLine(
        Offset(-s * 0.2, s * 0.18),
        Offset(s * 0.2, s * 0.18),
        guard,
      );
      canvas.drawLine(Offset(0, s * 0.18), Offset(0, s * 0.42), guard);
      canvas.restore();
    }

    sword(false);
    sword(true);
  }

  @override
  bool shouldRepaint(_SwordsPainter old) => old.color != color;
}
