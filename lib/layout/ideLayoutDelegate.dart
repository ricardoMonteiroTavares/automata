import 'package:flutter/widgets.dart';

class IDELayoutDelegate extends MultiChildLayoutDelegate {
  IDELayoutDelegate({required this.positions});

  final Map<String, Offset> positions;

  @override
  void performLayout(Size size) {
    for (String key in positions.keys) {
      if (hasChild(key)) {
        Size s = layoutChild(key, BoxConstraints.loose(size));
        Offset offset = positions[key]!;

        positionChild(
            key, Offset(offset.dx - (s.width / 2), offset.dy - (s.height / 2)));
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
