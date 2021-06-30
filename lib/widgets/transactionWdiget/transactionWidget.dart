import 'package:automata/elements/arrow.dart';
import 'package:automata/enums/repositionedConnector.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidgetController.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionWidgetController _controller = TransactionWidgetController();
  late final String _id;

  TransactionWidget(
      {required String id, required Pair<String, Offset> initPosition}) {
    _id = id;
    setInitialPosition(initPosition);
    setFinalPosition(initPosition);
  }

  Offset get initialPosition => _controller.initialPosition;
  void setInitialPosition(Pair<String, Offset> newInitialPosition) =>
      _controller.setInitialPosition(newInitialPosition);

  void setFinalPosition(Pair<String, Offset> newFinalPosition) =>
      _controller.setFinalPosition(newFinalPosition);
  Offset get finalPosition => _controller.finalPosition;

  set keyCode(String newCode) {
    _controller.setKeyCode(newCode);
  }

  void updatePosition(Pair<RepositionedConnector, Offset> delta) =>
      _controller.updatePosition;

  String get keyCode => _controller.keyCode;

  String get id => _id;

  Transaction get generateModel => _controller.generateModel;

  void select() => _controller.select();
  void unselect() => _controller.unselect();

  RepositionedConnector belongsState(String stateID) =>
      _controller.belongsState(stateID);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CustomPaint(
        painter: Arrow(
          color: _controller.color,
          initialPosition: initialPosition,
          finalPosition: finalPosition,
          keyCode: keyCode,
        ),
      ),
    );
  }
}
