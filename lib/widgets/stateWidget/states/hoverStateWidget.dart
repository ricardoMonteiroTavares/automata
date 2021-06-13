import 'package:automata/elements/pin.dart';
import 'package:flutter/material.dart';

/// Objeto que só aparece quando o mouse está por cima do objeto
class HoverStateWidget extends StatelessWidget {
  late final bool _hover;
  late final Function(Offset) _slot;
  HoverStateWidget(
      {required bool hover, required Function(Offset) onPanStart}) {
    _hover = hover;
    _slot = onPanStart;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _hover,
      child: Stack(
        children: [
          GestureDetector(
            onPanStart: _onStart,
            child: Pin(transform: Matrix4.translationValues(25, -4, 0)),
          ),
          GestureDetector(
            onPanStart: _onStart,
            child: Pin(transform: Matrix4.translationValues(25, 54, 0)),
          ),
          GestureDetector(
            onPanStart: _onStart,
            child: Pin(transform: Matrix4.translationValues(54, 25, 0)),
          ),
          GestureDetector(
            onPanStart: _onStart,
            child: Pin(transform: Matrix4.translationValues(-4, 25, 0)),
          ),
        ],
      ),
    );
  }

  void _onStart(DragStartDetails details) {
    _slot(details.localPosition);
  }
}
