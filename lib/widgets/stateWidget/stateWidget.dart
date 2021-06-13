import 'package:automata/enums/stateType.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/stateWidget/states/hoverStateWidget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stateWidgetController.dart';

class StateWidget extends StatelessWidget {
  late final StateWidgetController _controller;

  StateWidget(
      {required String id,
      required Offset position,
      required Function(String) selectOnDrag,
      required Either<String, Pair<String, double>> Function(Offset) getState,
      required Function(Offset) onStart}) {
    _controller = StateWidgetController(
        id: id,
        position: position,
        selectOnDrag: selectOnDrag,
        getState: getState,
        onStart: onStart);
  }

  String get id => _controller.id;

  void select() => _controller.select();

  void unselect() => _controller.unselect();

  StateType get type => _controller.type;

  set type(StateType newType) => _controller.newType(newType);

  Offset get position => _controller.position;

  Either<bool, double> pointIsInState(Offset point) =>
      _controller.pointIsInState(point);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MouseRegion(
          onEnter: _controller.onEnter,
          onExit: _controller.onExit,
          child: Stack(
            children: [
              (_controller.color == Colors.blue)
                  ? Draggable(
                      child: _controller.node(),
                      feedback: _controller.node(color: Colors.blue),
                      childWhenDragging: Container(),
                      onDragStarted: select,
                      onDragEnd: _controller.reposition,
                    )
                  : _controller.node(),
              HoverStateWidget(
                hover:
                    (_controller.hover && (_controller.color != Colors.blue)),
                onPanStart: _controller.onStart,
              )
            ],
          )),
    );
  }
}
