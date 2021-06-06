import 'package:automata/elements/label.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/widgets/stateWidget/states/finalState.dart';
import 'package:automata/widgets/stateWidget/states/initialState.dart';
import 'package:automata/widgets/stateWidget/states/normalState.dart';
import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  late final Function(String id, Offset pos) _onDragEnd;
  late final String _id;
  late final StateWidgetState _state;

  StateWidget(
      {required String id,
      required Function(String id, Offset pos) onDragEnd}) {
    _id = id;
    _onDragEnd = onDragEnd;
  }

  String get id => _id;

  @override
  StateWidgetState createState() {
    _state = StateWidgetState();
    return _state;
  }

  StateWidgetState get state => _state;
}

class StateWidgetState extends State<StateWidget> {
  late final Label _label = Label(
    label: widget._id,
  );
  final double _size = 60;

  Color _color = Colors.black;
  StateType _type = StateType.normal;

  void select() {
    setState(() {
      _color = Colors.blue;
    });
  }

  void unselect() {
    setState(() {
      _color = Colors.black;
    });
  }

  StateType get type => _type;

  set type(StateType newType) {
    setState(() {
      _type = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: _state(_color),
      feedback: _state(Colors.blue),
      childWhenDragging: Container(),
      onDragStarted: select,
      onDragEnd: (details) {
        Offset offset = details.offset + Offset((_size / 2), (_size / 2));
        widget._onDragEnd(widget._id, offset);
      },
    );
  }

  Widget _state(Color color) {
    switch (_type) {
      case StateType.normal:
        return NormalState(size: _size, child: _label, color: _color);

      case StateType.end:
        return FinalState(size: _size, child: _label, color: _color);

      case StateType.start:
        return InitialState(size: _size, child: _label, color: color);

      default:
        return Container();
    }
  }
}
