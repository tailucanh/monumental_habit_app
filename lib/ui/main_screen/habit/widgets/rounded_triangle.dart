import 'package:flutter/material.dart';

class RoundedTrianglePainter extends CustomPainter {
  final Color color;
  final double radius;
  final bool rotate;
  final bool isRadius;

  RoundedTrianglePainter(
      {required this.color, required this.radius, required this.rotate, this.isRadius = true});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final Path path = Path();

    if (rotate) {
      path.moveTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(0, 0);
    }
    path.close();
    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(0, size.height),
        Offset(size.width, 0),
      ),
       Radius.circular(isRadius ? radius : 0),
    );

    final Path roundedPath = Path()
      ..addRRect(roundedRect)
      ..close();

    final Path resultPath =
        Path.combine(PathOperation.intersect, path, roundedPath);

    canvas.drawPath(resultPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
