import 'package:flutter/widgets.dart';

class IDELayoutDelegate extends MultiChildLayoutDelegate {
  IDELayoutDelegate({required this.positions});

  final Map<int, Offset> positions;

  @override
  void performLayout(Size size) {
    for (int i in positions.keys) {
      if (hasChild(i)) {
        Size s = layoutChild(i, BoxConstraints.loose(size));
        Offset offset = positions[i]!;

        positionChild(
            i, Offset(offset.dx - (s.width / 2), offset.dy - (s.height / 2)));
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
