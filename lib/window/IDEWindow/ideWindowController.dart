import 'dart:ui';

import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'ideWindowController.g.dart';

class IDEWindowController = _IDEWindowController with _$IDEWindowController;

abstract class _IDEWindowController with Store {
  @observable
  GraphicAutomataManager _manager = GraphicAutomataManager();

  @computed
  List<LayoutId> get objects => _manager.objects;

  @computed
  IDELayoutDelegate get positions => _manager.positions;

  @action
  void add(TapDownDetails details) {
    Offset position = details.localPosition;

    String id = _manager.getState(position);

    if (id.isEmpty) {
      if (_manager.containsSelectState) {
        _manager.unselectState();
      } else {
        _manager.addState(position);
      }
    }
  }

  @action
  void delete() {
    _manager.deleteState();
  }
}
