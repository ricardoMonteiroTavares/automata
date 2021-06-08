import 'package:automata/elements/label.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/widgets/stateWidget/states/finalState.dart';
import 'package:automata/widgets/stateWidget/states/initialState.dart';
import 'package:automata/widgets/stateWidget/states/normalState.dart';
import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  late final String _id;
  late final _StateWidgetState _state;

  StateWidget({required String id, required Offset position}) {
    _id = id;
    _state = _StateWidgetState(position: position);
  }

  String get id => _id;

  @override
  _StateWidgetState createState() => _state;

  _StateWidgetState get state => _state;
}

class _StateWidgetState extends State<StateWidget> {
  late final Label _label = Label(
    label: widget._id,
  );
  final double _size = 60;

  Color _color = Colors.black;
  StateType _type = StateType.normal;

  late Offset _position;

  _StateWidgetState({required Offset position}) {
    _position = position;
  }

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

  Offset get position => _position;

  bool pointIsInState(Offset point) {
    double distance = (point - position).distance.abs();
    return (distance <= (_size / 2));
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: _state(_color),
      feedback: _state(Colors.blue),
      childWhenDragging: Container(),
      onDragStarted: select,
      onDragEnd: _reposition,
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

  void _reposition(DraggableDetails details) {
    Offset offset = details.offset + Offset((_size / 2), (_size / 2));

    setState(() {
      _position = offset;
    });
  }
}
