import 'package:flutter/material.dart';

class StateWidget extends StatelessWidget {
  late final String _name;
  final double _size = 60;
  StateWidget({required String name}) {
    _name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      child: Center(
        child: Text(_name),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2.0)),
    );
  }
}
