import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:flutter/widgets.dart';

class IDELayoutDelegate extends MultiChildLayoutDelegate {
  IDELayoutDelegate({
    required this.states,
    required this.transactions,
  });

  final Map<String, StateWidget> states;
  final Map<String, TransactionWidget> transactions;

  @override
  void performLayout(Size size) {
    if (states.isNotEmpty) {
      for (String key in states.keys) {
        if (hasChild(key)) {
          Size s = layoutChild(key, BoxConstraints.loose(size));
          Offset offset = states[key]!.position;

          positionChild(key,
              Offset(offset.dx - (s.width / 2), offset.dy - (s.height / 2)));
        }
      }
    }
    if (transactions.isNotEmpty) {
      for (String key in transactions.keys) {
        if (hasChild(key)) {
          Offset offset = transactions[key]!.initialPosition;

          positionChild(key, Offset(offset.dx, offset.dy));
        }
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
