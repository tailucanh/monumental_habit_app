import 'package:flutter/material.dart';

class RoundedTrianglePainter extends CustomPainter {
  final Color color;
  final double radius;

  RoundedTrianglePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(0, 0)
      ..close();

    // Bo góc bằng cách sử dụng RRect và Path.combine
    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(0, size.height),
        Offset(size.width, 0),
      ),
      Radius.circular(radius), // Bán kính bo góc
    );

    final Path roundedPath = Path()
      ..addRRect(roundedRect)
      ..close();

    final Path resultPath = Path.combine(PathOperation.intersect, path, roundedPath);

    canvas.drawPath(resultPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
