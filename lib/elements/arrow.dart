import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arrow_path/flutter_arrow_path.dart';

class Arrow extends CustomPainter {
  late Offset finalPosition;
  late Offset initialPosition;
  late String keyCode;
  late Color color;
  Arrow(
      {required this.initialPosition,
      required this.finalPosition,
      required this.keyCode,
      required this.color});

  late final Paint _paint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..strokeWidth = 3.0;

  late final TextPainter _textPainter = TextPainter(
    text: TextSpan(
      text: keyCode,
      style: TextStyle(color: color),
    ),
    textDirection: TextDirection.ltr,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    // Ponto inicial
    path.moveTo(0, 0);
    Offset distance = finalPosition - initialPosition;
    // Curva no estilo linha reta
    path.relativeLineTo(distance.dx, distance.dy);

    path = ArrowPath.make(path: path);
    canvas.drawPath(path, _paint);

    _textPainter.layout(minWidth: size.width);

    double centerY = (distance.dy / 2) - 20;
    double centerX = (distance.dx / 2);

    Offset textPos = Offset(centerX, centerY);
    _textPainter.paint(canvas, textPos);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
