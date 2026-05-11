import 'dart:math';
import 'package:flutter/material.dart';

// ── Dial Painter ───────────────────────────────────────────────────────────
class DialPainter extends CustomPainter {
  final double targetTemp;
  final double minTemp;
  final double maxTemp;

  DialPainter({
    required this.targetTemp,
    required this.minTemp,
    required this.maxTemp,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.41;

    const startAngle = pi * 0.72;
    const endAngle = pi * 2.28;
    final frac = (targetTemp - minTemp) / (maxTemp - minTemp);
    final fillAngle = startAngle + frac * (endAngle - startAngle);

    final trackPaint = Paint()
      ..color = const Color(0xFF1E2330)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      startAngle,
      endAngle - startAngle,
      false,
      trackPaint,
    );

    final gradPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
        colors: const [
          Color(0xFF3A5EC8),
          Color(0xFF9B3FC8),
          Color(0xFFCC3333),
        ],
      ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      startAngle,
      fillAngle - startAngle,
      false,
      gradPaint,
    );

    final thumbX = cx + r * cos(fillAngle);
    final thumbY = cy + r * sin(fillAngle);
    canvas.drawCircle(
      Offset(thumbX, thumbY),
      7,
      Paint()..color = const Color(0xFF4ECDC4),
    );

    canvas.drawCircle(
      Offset(thumbX, thumbY),
      4,
      Paint()..color = const Color(0xFF0B0D13),
    );

    final labelStyle = const TextStyle(
      fontSize: 11,
      color: Color(0xFF6B7588),
    );
    _drawLabel(canvas, '16°C', cx, cy, r + 18, startAngle, labelStyle);
    _drawLabel(canvas, '30°C', cx, cy, r + 18, endAngle, labelStyle);
  }

  void _drawLabel(Canvas canvas, String text, double cx, double cy,
      double labelR, double angle, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    final lx = cx + labelR * cos(angle) - tp.width / 2;
    final ly = cy + labelR * sin(angle) - tp.height / 2;
    tp.paint(canvas, Offset(lx, ly));
  }

  @override
  bool shouldRepaint(DialPainter old) => old.targetTemp != targetTemp;
}
