import 'package:automata/elements/circle.dart';
import 'package:flutter/material.dart';

class FinalState extends StatelessWidget {
  late final Widget _child;
  late final double _size;
  late final Color _color;

  FinalState(
      {required double size, required Widget child, required Color color}) {
    _child = child;
    _size = size;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Circle(
      size: _size,
      child: Circle(
        child: _child,
        size: (_size - 10),
        color: _color,
      ),
      color: _color,
    );
  }
}
