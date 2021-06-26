import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arrow_path/flutter_arrow_path.dart';

class Arrow extends CustomPainter {
  late Offset finalPosition;
  late Offset initialPosition;
  late String keyCode;
  Arrow(
      {required this.initialPosition,
      required this.finalPosition,
      required this.keyCode});

  final Paint _paint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..strokeWidth = 3.0;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    // Ponto inicial
    path.moveTo(0, 0);
    Offset distance = finalPosition - initialPosition;
    // Curva no estilo linha reta
    path.relativeLineTo(distance.dx, distance.dy);

    path = ArrowPath.make(path: path);
    canvas.drawPath(path, _paint..color = Colors.blue);

    TextSpan textSpan = TextSpan(
      text: keyCode,
      style: TextStyle(color: Colors.blue),
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset((distance.dx / 2), size.height * 0.06));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
