import 'package:automata/elements/circle.dart';
import 'package:automata/elements/triangle.dart';
import 'package:flutter/material.dart';

class InitialState extends StatelessWidget {
  late final Widget _child;
  late final double _size;
  late final Color _color;

  InitialState(
      {required double size, required Widget child, required Color color}) {
    _child = child;
    _size = size;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Triangle(
          size: _size,
          color: _color,
        ),
        Circle(
          child: _child,
          size: _size,
          color: _color,
        )
      ],
    );
  }
}
