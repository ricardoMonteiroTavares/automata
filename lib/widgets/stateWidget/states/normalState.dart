import 'package:automata/elements/circle.dart';
import 'package:flutter/material.dart';

class NormalState extends StatelessWidget {
  late final Widget _child;
  late final double _size;
  late final Color _color;

  NormalState(
      {required double size, required Widget child, required Color color}) {
    _child = child;
    _size = size;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Circle(
      child: _child,
      size: _size,
      color: _color,
    );
  }
}
