import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'ideWindowController.dart';

class IDEWindow extends StatefulWidget {
  @override
  _IDEWindowState createState() => _IDEWindowState();
}

class _IDEWindowState extends State<IDEWindow> {
  final IDEWindowController _controller = IDEWindowController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          _controller.add(details);
        },
        child: Scaffold(
          body: Observer(
              builder: (_) => CustomMultiChildLayout(
                    delegate:
                        IDELayoutDelegate(positions: _controller.positions),
                    children: _controller.states,
                  )),
        ));
  }
}
