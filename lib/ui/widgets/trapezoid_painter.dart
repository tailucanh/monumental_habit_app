import 'package:flutter/material.dart';

class TrapezoidContainer extends StatelessWidget {
  final double width;
  final double topHeight;
  final double bottomHeight;
  final double borderRadius;
  final Gradient gradient;

  const TrapezoidContainer({
    Key? key,
    required this.width,
    required this.topHeight,
    required this.bottomHeight,
    required this.borderRadius,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, topHeight > bottomHeight ? topHeight : bottomHeight),
      painter: TrapezoidPainter(
        topHeight: topHeight,
        bottomHeight: bottomHeight,
        borderRadius: borderRadius,
        gradient: gradient,
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  final double topHeight;
  final double bottomHeight;
  final double borderRadius;
  final Gradient gradient;

  TrapezoidPainter({
    required this.topHeight,
    required this.bottomHeight,
    required this.borderRadius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, topHeight)
      ..lineTo(size.width, size.height)
      ..lineTo(0, bottomHeight)
      ..close();

    final rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    canvas.clipPath(Path()..addRRect(rrect));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}