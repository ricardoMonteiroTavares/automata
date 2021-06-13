import 'package:automata/elements/label.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/stateWidget/states/finalState.dart';
import 'package:automata/widgets/stateWidget/states/hoverStateWidget.dart';
import 'package:automata/widgets/stateWidget/states/initialState.dart';
import 'package:automata/widgets/stateWidget/states/normalState.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'stateWidgetController.g.dart';

class StateWidgetController extends _StateWidgetController
    with _$StateWidgetController {
  StateWidgetController(
      {required String id,
      required Offset position,
      required Function(String) selectOnDrag,
      required Options3<String, double, Offset> Function(Offset) getState,
      required Function(Offset) onStart}) {
    super._id = id;
    super._position = position;
    super._selectState = selectOnDrag;
    super._getState = getState;
    super._onStart = onStart;
  }
}

abstract class _StateWidgetController with Store {
  final double _diameter = 60;
  final double _radius = 30;

  late final Function(String) _selectState;
  late final Options3<String, double, Offset> Function(Offset) _getState;
  late final Function(Offset) _onStart;

  @observable
  bool _hover = false;

  @observable
  Color _color = Colors.black;

  @observable
  StateType _type = StateType.normal;

  @observable
  Offset _position = Offset(-1, -1);

  @observable
  late HoverStateWidget _hoverState = HoverStateWidget(
    hover: (hover && (color != Colors.blue)),
  );

  late final String _id;
  late final Label _label = Label(
    label: _id,
  );

  @action
  void select() {
    _color = Colors.blue;
  }

  @action
  void unselect() {
    _color = Colors.black;
  }

  @action
  void newType(StateType newType) {
    _type = newType;
  }

  @action
  void onEnter(PointerEnterEvent details) {
    _hover = true;
    print("State: $id, Hover: ${hover.toString()}");
  }

  @action
  void onExit(PointerExitEvent details) {
    _hover = false;
    print("State: $id, Hover: ${hover.toString()}");
  }

  @action
  void reposition(DraggableDetails details) {
    Offset prevPosition = position;
    Offset newPosition = details.offset + Offset(_radius, _radius);

    Options3<String, double, Offset> resp = _getState(newPosition);

    _position = resp.fold<Offset>(
      (l) => prevPosition,
      (m) => (m > _diameter) ? newPosition : prevPosition,
      (r) => prevPosition,
    );

    _selectState(id);
  }

  Options3<bool, double, Offset> pointIsInState(Offset point) {
    double distance = (point - position).distance.abs();

    Either<bool, Offset> resp = _hoverState.clickInPin(_position, point);

    return resp.fold(
        (l) => (distance < _radius) ? LeftOption(true) : MiddleOption(distance),
        (r) => RightOption(r));
  }

  Widget node({Color? color}) {
    Color c = (color == null) ? _color : color;
    switch (_type) {
      case StateType.normal:
        return NormalState(size: _diameter, child: _label, color: c);

      case StateType.end:
        return FinalState(size: _diameter, child: _label, color: c);

      case StateType.start:
        return InitialState(size: _diameter, child: _label, color: c);

      default:
        return Container();
    }
  }

  String get id => _id;
  StateType get type => _type;
  Offset get position => _position;
  Color get color => _color;
  bool get hover => _hover;
  Function(Offset) get onStart => _onStart;
}
