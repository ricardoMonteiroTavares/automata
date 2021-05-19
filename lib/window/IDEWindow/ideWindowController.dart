import 'dart:ui';

import 'package:automata/widgets/stateWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'ideWindowController.g.dart';

class IDEWindowController = _IDEWindowController with _$IDEWindowController;

abstract class _IDEWindowController with Store {
  @observable
  ObservableList<LayoutId> states = ObservableList<LayoutId>();

  @observable
  ObservableMap<int, Offset> positions = ObservableMap<int, Offset>();

  @action
  void addState(TapDownDetails details) {
    int id;
    if (states.isEmpty) {
      id = 0;
    } else {
      var obj = states[states.length - 1].id;
      id = int.parse(obj.toString()) + 1;
    }
    positions.addAll({id: details.localPosition});
    states.add(LayoutId(id: states.length, child: StateWidget(name: "q$id")));
  }
}
