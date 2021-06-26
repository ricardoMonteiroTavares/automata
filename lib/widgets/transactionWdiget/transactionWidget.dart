import 'package:automata/elements/arrow.dart';
import 'package:flutter/material.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidgetController.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionWidgetController _controller = TransactionWidgetController();
  late final String _id;

  TransactionWidget({required String id, required Offset initPosition}) {
    _id = id;
    initialPosition = initPosition;
    finalPosition = initPosition;
  }

  Offset get initialPosition => _controller.initialPosition;
  set initialPosition(Offset newInitialPosition) =>
      _controller.setInitialPosition(newInitialPosition);

  set finalPosition(Offset newFinalPosition) =>
      _controller.setFinalPosition(newFinalPosition);
  Offset get finalPosition => _controller.finalPosition;

  set keyCode(String newCode) {
    _controller.setKeyCode(newCode);
  }

  String get keyCode => _controller.keyCode;

  String get id => _id;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CustomPaint(
        painter: Arrow(
          initialPosition: initialPosition,
          finalPosition: finalPosition,
          keyCode: keyCode,
        ),
      ),
    );
  }
}
