import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  late final Function(StateWidgetState) _onSelect;
  late final Function(String id, Offset pos) _onDragEnd;
  late final String _id;

  StateWidget(
      {required String id,
      required Function(StateWidgetState) onSelect,
      required Function(String id, Offset pos) onDragEnd}) {
    _id = id;
    _onSelect = onSelect;
    _onDragEnd = onDragEnd;
  }

  String get id => _id;

  @override
  StateWidgetState createState() => StateWidgetState();
}

class StateWidgetState extends State<StateWidget> {
  final double _size = 60;

  Color _color = Colors.black;

  void select() {
    setState(() {
      _color = Colors.blue;
    });

    widget._onSelect(this);
  }

  void unselect() {
    setState(() {
      _color = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: select,
      child: Draggable(
        child: _circle(_color),
        feedback: _circle(Colors.blue),
        childWhenDragging: Container(),
        onDragStarted: select,
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
        child: Material(
          child: Text(
            widget._id,
            style: TextStyle(
                fontFamily: 'Courier New',
                color: Colors.grey[800],
                fontSize: 12),
          ),
        ),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: color, width: 2.0)),
    );
  }
}
