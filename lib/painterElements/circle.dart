import 'package:flutter/material.dart';

class Circle extends CustomPaint {
  late final double _radius;
  Circle({required double radius}) {
    _radius = radius;
  }

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(Offset(0, 0), _radius, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
