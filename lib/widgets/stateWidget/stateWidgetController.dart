import 'package:automata/elements/label.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/stateWidget/states/finalState.dart';
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
      required Options3<String, double, Pair<String, Offset>> Function(Offset)
          getState}) {
    super._id = id;
    super._position = position;
    super._selectState = selectOnDrag;
    super._getState = getState;
  }
}

abstract class _StateWidgetController with Store {
  final double _diameter = 60;
  final double _radius = 30;

  late final Function(String) _selectState;
  late final Options3<String, double, Pair<String, Offset>> Function(Offset)
      _getState;

  final Map<String, Offset> _pinPositions = {
    "c1": Offset(25, -10),
    "c2": Offset(25, 60),
    "c3": Offset(60, 25),
    "c4": Offset(-10, 25)
  };

  @observable
  bool _hover = false;

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

    Options3<String, double, Pair<String, Offset>> resp =
        _getState(newPosition);

    _position = resp.fold<Offset>(
      (l) => prevPosition,
      (m) => (m > _diameter) ? newPosition : prevPosition,
      (r) => prevPosition,
    );

    _selectState(id);
    // TODO: Realizar o reposicionamento dos conectores das transações
  }

  Options3<bool, double, Pair<String, Offset>> pointIsInState(Offset point) {
    double distance = (point - position).distance.abs();

    Either<bool, Offset> resp = clickInPin(position, point);

    return resp.fold(
      (l) => (distance < _radius) ? LeftOption(true) : MiddleOption(distance),
      (r) => RightOption(Pair(id, r)),
    );
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

  /// Função que verifica se o click foi realizado em cima de algum dos pins
  @action
  Either<bool, Offset> clickInPin(Offset centerNode, Offset clickPosition) {
    print("Executando: HoverStateWidget.clickInPin, Estado: $id");
    Offset topLeftNode = centerNode - Offset(30, 30);
    print("--------- topLeftNode: ${topLeftNode.toString()}");
    Offset localPosition = clickPosition - topLeftNode;
    print("--------- Click: ${clickPosition.toString()}");
    print("--------- LocalPosition: ${localPosition.toString()}");
    for (String key in _pinPositions.keys) {
      Offset topLeft = _pinPositions[key]!;
      Offset bottomRight = topLeft + Offset(10, 10);

      print(
          "$key: TopLeft: ${topLeft.toString()} BottomRight: ${bottomRight.toString()}");
      if (topLeft.dx <= localPosition.dx &&
          localPosition.dx <= bottomRight.dx &&
          topLeft.dy <= localPosition.dy &&
          localPosition.dy <= bottomRight.dy) {
        print("Clicou");
        return Right(topLeftNode + topLeft + Offset(5, 5));
      }
    }

    return Left(false);
  }

  String get id => _id;
  StateType get type => _type;
  Offset get position => _position;
  Color get color => _color;
  bool get hover => _hover;
  Map<String, Offset> get pinPositions => _pinPositions;
}
