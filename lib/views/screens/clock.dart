import 'package:flutter/material.dart';
import 'dart:math';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw clock circle
    paint.strokeWidth = 5;
    canvas.drawCircle(center, radius, paint);

    // Draw clock ticks
    paint.strokeWidth = 1;
    for (int i = 0; i < 60; i++) {
      double tickLength = i % 5 == 0 ? 10 : 5;
      double angle = i * pi / 30;
      final p1 = Offset(
          center.dx + radius * cos(angle), center.dy + radius * sin(angle));
      final p2 = Offset(center.dx + (radius - tickLength) * cos(angle),
          center.dy + (radius - tickLength) * sin(angle));
      canvas.drawLine(p1, p2, paint);
    }

    // Draw hour hand
    final hourAngle = (dateTime.hour % 12 + dateTime.minute / 60) * pi / 6;
    paint.color = Colors.black;
    paint.strokeWidth = 10;
    final hourHandX = center.dx + radius * 0.5 * cos(hourAngle - pi / 2);
    final hourHandY = center.dy + radius * 0.5 * sin(hourAngle - pi / 2);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), paint);

    // Draw minute hand
    final minuteAngle = (dateTime.minute + dateTime.second / 60) * pi / 30;
    paint.color = Colors.black;
    paint.strokeWidth = 5;
    final minuteHandX = center.dx + radius * 0.7 * cos(minuteAngle - pi / 2);
    final minuteHandY = center.dy + radius * 0.7 * sin(minuteAngle - pi / 2);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), paint);

    // Draw second hand
    final secondAngle = dateTime.second * pi / 30;
    paint.color = Colors.red;
    paint.strokeWidth = 2;
    final secondHandX = center.dx + radius * 0.9 * cos(secondAngle - pi / 2);
    final secondHandY = center.dy + radius * 0.9 * sin(secondAngle - pi / 2);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), paint);

    // Draw center point
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, 8, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
