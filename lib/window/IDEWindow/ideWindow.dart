import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'ideWindowController.dart';

class IDEWindow extends StatefulWidget {
  @override
  _IDEWindowState createState() => _IDEWindowState();
}

class _IDEWindowState extends State<IDEWindow> {
  final IDEWindowController _controller = IDEWindowController();
  FocusNode node = FocusNode();

  void keyPressed(RawKeyEvent key) {
    if (key.logicalKey == LogicalKeyboardKey.delete) {
      _controller.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(node);
    return GestureDetector(
      onTapDown: (details) {
        _controller.onTap(details);
      },
      onSecondaryTapDown: (details) =>
          _controller.contextMenu(details, context),
      onPanUpdate: _controller.onUpdate,
      onPanEnd: (details) => _controller.onFinish(details, context),
      child: Scaffold(
        body: RawKeyboardListener(
          autofocus: true,
          focusNode: node,
          onKey: keyPressed,
          child: Observer(
            builder: (_) => CustomMultiChildLayout(
              delegate: _controller.positions,
              children: _controller.objects,
            ),
          ),
        ),
      ),
    );
  }
}
