import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Container(
            width: 10,
            height: 10,
            transform: Matrix4.translationValues(25, -4, 0),
            child: SvgPicture.asset(
              "assets/pin.svg",
              width: 10,
              height: 10,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            transform: Matrix4.translationValues(25, 54, 0),
            child: SvgPicture.asset(
              "assets/pin.svg",
              width: 10,
              height: 10,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            transform: Matrix4.translationValues(54, 25, 0),
            child: SvgPicture.asset(
              "assets/pin.svg",
              width: 10,
              height: 10,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            transform: Matrix4.translationValues(-4, 25, 0),
            child: SvgPicture.asset(
              "assets/pin.svg",
              width: 10,
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
