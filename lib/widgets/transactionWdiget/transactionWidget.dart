import 'package:automata/elements/arrow.dart';
import 'package:flutter/material.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidgetController.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionWidgetController _controller = TransactionWidgetController();
  late final String _id;

  TransactionWidget({required String id, required Offset initialPosition}) {
    _id = id;
    _controller.setInitialPosition(initialPosition);
  }

  Offset get initialPosition => _controller.initialPosition;
  set distance(Offset newDistance) => _controller.setDistance(newDistance);

  String get id => _id;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CustomPaint(
        painter: Arrow(
          distance: _controller.distance,
        ),
      ),
    );
  }
}
