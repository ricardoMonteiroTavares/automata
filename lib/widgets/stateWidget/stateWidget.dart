import 'package:automata/elements/label.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/widgets/stateWidget/states/finalState.dart';
import 'package:automata/widgets/stateWidget/states/initialState.dart';
import 'package:automata/widgets/stateWidget/states/normalState.dart';
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
      onSecondaryTapDown: updateType,
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

  Future<void> updateType(TapDownDetails details) async {
    select();
    Offset position = details.globalPosition;
    RelativeRect pos = RelativeRect.fromLTRB(
        position.dx, position.dy, (position.dx + 30), (position.dy + 90));
    StateType? newType = await popMenu(pos);
    if (newType != null) {
      setState(() {
        _type = newType;
      });
    }
  }

  Future<StateType?> popMenu(RelativeRect pos) async {
    return showMenu<StateType>(
      context: context,
      position: pos,
      items: [
        PopupMenuItem(
          enabled: (_type != StateType.start),
          value: StateType.start,
          height: 30,
          child: Text("Marcar como estado inicial"),
        ),
        PopupMenuItem(
          enabled: (_type != StateType.end),
          value: StateType.end,
          height: 30,
          child: Text("Marcar como estado final"),
        ),
        PopupMenuItem(
          enabled: (_type != StateType.normal),
          value: StateType.normal,
          height: 30,
          child: Text("Marcar como estado normal"),
        ),
      ],
    );
  }
}
