import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/widgets.dart';

class IDELayoutDelegate extends MultiChildLayoutDelegate {
  IDELayoutDelegate({required this.states});

  final Map<String, StateWidget> states;

  @override
  void performLayout(Size size) {
    for (String key in states.keys) {
      if (hasChild(key)) {
        Size s = layoutChild(key, BoxConstraints.loose(size));
        Offset offset = states[key]!.state.position;

        positionChild(
            key, Offset(offset.dx - (s.width / 2), offset.dy - (s.height / 2)));
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
