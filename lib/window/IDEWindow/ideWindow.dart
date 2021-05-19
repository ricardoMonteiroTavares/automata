import 'dart:ui';

import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/widgets/stateWidget.dart';
import 'package:flutter/material.dart';

class IDEWindow extends StatefulWidget {
  @override
  _IDEWindowState createState() => _IDEWindowState();
}

class _IDEWindowState extends State<IDEWindow> {
  List<LayoutId> _states = [
    LayoutId(id: 0, child: StateWidget(name: "q0")),
    LayoutId(id: 1, child: StateWidget(name: "q0")),
  ];

  Map<int, Offset> _positions = {0: Offset(200, 200), 1: Offset(400, 200)};
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          setState(() {
            int id;
            if (_states.isEmpty) {
              id = 0;
            } else {
              var obj = _states[_states.length - 1].id;
              id = int.parse(obj.toString()) + 1;
            }
            _positions.addAll({id: details.localPosition});
            _states.add(
                LayoutId(id: _states.length, child: StateWidget(name: "q0")));
          });
        },
        child: Scaffold(
          body: CustomMultiChildLayout(
            delegate: IDELayoutDelegate(positions: _positions),
            children: _states,
          ),
        ));
  }
}
