import 'package:automata/painterElements/circle.dart';
import 'package:flutter/material.dart';

class StateWidget extends StatelessWidget {
  late final String _name;
  final double _size = 100;
  StateWidget({required String name}) {
    _name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _size,
        width: _size,
        child: Stack(
          children: [
            Text(_name),
            CustomPaint(
              child: Circle(radius: (_size / 2)),
            ),
          ],
        ));
  }
}
