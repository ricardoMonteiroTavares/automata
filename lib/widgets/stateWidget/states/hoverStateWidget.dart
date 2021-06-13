import 'package:automata/elements/pin.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// Objeto que só aparece quando o mouse está por cima do objeto
class HoverStateWidget extends StatelessWidget {
  late final bool _hover;

  HoverStateWidget({required bool hover}) {
    _hover = hover;
  }

  final Map<String, Offset> _pinPositions = {
    "c1": Offset(25, -4),
    "c2": Offset(25, 54),
    "c3": Offset(54, 25),
    "c4": Offset(-4, 25)
  };

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

  /// Função que verifica se o click foi realizado em cima de algum dos pins
  Either<bool, Offset> clickInPin(Offset centerNode, Offset clickPosition) {
    Offset topLeftNode = centerNode - Offset(30, 30);
    for (String key in _pinPositions.keys) {
      Offset topLeft = topLeftNode + _pinPositions[key]!;
      Offset bottomRight = topLeftNode + Offset(10, 10);
      if (topLeft.dx >= clickPosition.dx &&
          clickPosition.dx <= bottomRight.dx &&
          topLeft.dy >= clickPosition.dy &&
          clickPosition.dy <= bottomRight.dy) {
        return Right(topLeft + Offset(5, 5));
      }
    }

    return Left(false);
  }
}
