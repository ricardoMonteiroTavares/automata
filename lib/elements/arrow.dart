import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arrow_path/flutter_arrow_path.dart';

class Arrow extends CustomPainter {
  late Offset distance;

  Arrow({required this.distance});

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

    // Curva no estilo linha reta
    path.relativeLineTo(distance.dx, distance.dy);

    path = ArrowPath.make(path: path);
    canvas.drawPath(path, _paint..color = Colors.blue);

    TextSpan textSpan = TextSpan(
      text: 'Single arrow',
      style: TextStyle(color: Colors.blue),
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset(0, size.height * 0.06));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
