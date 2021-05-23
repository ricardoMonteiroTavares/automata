import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  late final Function(StateWidgetState) _onSelect;
  late final Function(int id, Offset pos) _onDragEnd;
  late final int _id;
  late final String _name;

  StateWidget(
      {required int id,
      required String name,
      required Function(StateWidgetState) onSelect,
      required Function(int id, Offset pos) onDragEnd}) {
    _id = id;
    _name = name;
    _onSelect = onSelect;
    _onDragEnd = onDragEnd;
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
      onTap: () => {widget._onSelect(this)},
      child: Draggable(
        child: _circle(_color),
        feedback: _circle(Colors.blue),
        childWhenDragging: Container(),
        onDragStarted: () => {widget._onSelect(this)},
        onDragEnd: (details) {
          Offset offset = details.offset;
          offset = offset + Offset((_size / 2), (_size / 2));
          widget._onDragEnd(widget._id, offset);
        },
      ),
    );
  }

  Container _circle(Color color) {
    return Container(
      height: _size,
      width: _size,
      child: Center(
        child: Text(
          widget._name,
          style: TextStyle(
              fontFamily: 'Courier New', color: Colors.grey[800], fontSize: 12),
        ),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: color, width: 2.0)),
    );
  }
}
