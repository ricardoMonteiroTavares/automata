import 'package:automata/elements/label.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/widgets/stateWidget/states/finalState.dart';
import 'package:automata/widgets/stateWidget/states/initialState.dart';
import 'package:automata/widgets/stateWidget/states/normalState.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'stateWidgetController.g.dart';

class StateWidgetController extends _StateWidgetController
    with _$StateWidgetController {
  StateWidgetController(
      {required String id,
      required Offset position,
      required Function(String) selectOnDrag}) {
    super._id = id;
    super._position = position;
    super._selectState = selectOnDrag;
  }
}

abstract class _StateWidgetController with Store {
  final double _diameter = 60;
  final double _radius = 30;

  late final Function(String) _selectState;

  @observable
  Color _color = Colors.black;

  @observable
  StateType _type = StateType.normal;

  @observable
  Offset _position = Offset(-1, -1);

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
  void reposition(DraggableDetails details) {
    _position = details.offset + Offset(_radius, _radius);
    _selectState(id);
  }

  Either<bool, double> pointIsInState(Offset point) {
    double distance = (point - position).distance.abs();

    if (distance <= _radius) {
      return Left(true);
    }
    return Right(distance);
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
}
