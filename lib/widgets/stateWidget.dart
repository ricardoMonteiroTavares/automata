import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  late final Function _f;
  late final int _id;
  late final String _name;

  StateWidget({required int id, required String name, required Function f}) {
    _id = id;
    _name = name;
    _f = f;
  }

  int get id => _id;

  @override
  StateWidgetState createState() => StateWidgetState();
}

class StateWidgetState extends State<StateWidget> {
  final double _size = 60;

  Color _color = Colors.black;

  updateColor() {
    setState(() {
      if (_color == Colors.black) {
        _color = Colors.blue;
      } else {
        _color = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {widget._f(this)},
      child: Container(
        height: _size,
        width: _size,
        child: Center(
          child: Text(widget._name),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: _color, width: 2.0)),
      ),
    );
  }
}
