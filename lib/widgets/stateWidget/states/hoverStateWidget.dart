import 'package:automata/elements/pin.dart';
import 'package:flutter/material.dart';

/// Objeto que só aparece quando o mouse está por cima do objeto
class HoverStateWidget extends StatelessWidget {
  late final bool _hover;
  HoverStateWidget({required bool hover}) {
    _hover = hover;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _hover,
      child: Stack(
        children: [
          Pin(transform: Matrix4.translationValues(25, -4, 0)),
          Pin(transform: Matrix4.translationValues(25, 54, 0)),
          Pin(transform: Matrix4.translationValues(54, 25, 0)),
          Pin(transform: Matrix4.translationValues(-4, 25, 0)),
        ],
      ),
    );
  }
}
