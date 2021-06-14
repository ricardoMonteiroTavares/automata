import 'package:automata/elements/pin.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// Objeto que só aparece quando o mouse está por cima do objeto
class HoverStateWidget extends StatelessWidget {
  late final bool _hover;
  late final Map<String, Offset> _pinPositions;

  HoverStateWidget(
      {required bool hover, required Map<String, Offset> pinPositions}) {
    _hover = hover;
    _pinPositions = pinPositions;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _hover,
      child: Stack(
        children: [
          Transform.translate(
            offset: _pinPositions["c1"]!,
            child: Pin(),
          ),
          Transform.translate(
            offset: _pinPositions["c2"]!,
            child: Pin(),
          ),
          Transform.translate(
            offset: _pinPositions["c3"]!,
            child: Pin(),
          ),
          Transform.translate(
            offset: _pinPositions["c4"]!,
            child: Pin(),
          ),
        ],
      ),
    );
  }
}
