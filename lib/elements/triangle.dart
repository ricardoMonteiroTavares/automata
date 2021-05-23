import 'package:automata/painters/trianglePainter.dart';
import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  late final double _size;
  late final Color _color;

  Triangle({required double size, required Color color}) {
    _size = size;
    _color = color;
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(
        strokeColor: _color,
      ),
      child: Container(
        height: (_size / 3),
        width: (_size / 3),
      ),
    );
  }
}
