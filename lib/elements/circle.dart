import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  late final Widget _child;
  late final double _size;
  late final Color _color;

  Circle({required double size, required Widget child, required Color color}) {
    _child = child;
    _size = size;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      child: Center(
        child: _child,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: _color, width: 2.0)),
    );
  }
}
