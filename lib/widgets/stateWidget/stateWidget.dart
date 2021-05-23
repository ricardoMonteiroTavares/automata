import 'package:automata/elements/circle.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/widgets/stateWidget/states/initialState.dart';
import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  late final Function(StateWidgetState) _onSelect;
  late final Function(String id, Offset pos) _onDragEnd;
  late final String _id;
  late final StateType _type;

  StateWidget(
      {required String id,
      required Function(StateWidgetState) onSelect,
      required Function(String id, Offset pos) onDragEnd,
      required StateType type}) {
    _id = id;
    _onSelect = onSelect;
    _onDragEnd = onDragEnd;
    _type = type;
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
        child: _state(_color),
        feedback: _state(Colors.blue),
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

  Widget _state(Color color) {
    switch (widget._type) {
      case StateType.normal:
        return Circle(
          child: _text(),
          size: _size,
          color: _color,
        );
      case StateType.end:
        return Circle(
          size: _size,
          child: Circle(
            child: _text(),
            size: (_size - 10),
            color: color,
          ),
          color: color,
        );
      case StateType.start:
        return InitialState(
          child: _text(),
          size: _size,
          color: color,
        );
      default:
        return Container();
    }
  }

  Material _text() {
    return Material(
      child: Text(
        widget._id,
        style: TextStyle(
            fontFamily: 'Courier New', color: Colors.grey[800], fontSize: 12),
      ),
    );
  }
}
