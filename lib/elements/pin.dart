import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Objeto que representa um "Pin"
class Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      child: SvgPicture.asset(
        "assets/pin.svg",
        width: 10,
        height: 10,
      ),
    );
  }
}
