import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/widgets/contextMenuWidget/contextMenuWidget.dart';
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
  void onTap(TapDownDetails details) {
    Offset position = details.localPosition;

    String id = _manager.getState(position);

    if (id.isEmpty) {
      if (_manager.containsSelectState) {
        _unselect();
      } else {
        _add(position);
      }
    } else {
      _select(id);
    }
  }

  @action
  void _add(Offset position) {
    _manager.addState(position);
  }

  @action
  void _select(String id) {
    _unselect();
    _manager.selectState(id);
  }

  @action
  void _unselect() {
    if (_manager.containsSelectState) {
      _manager.unselectState();
    }
  }

  @action
  void delete() {
    _manager.deleteState();
  }

  Future<void> contextMenu(TapDownDetails details, BuildContext context) async {
    if (_manager.containsSelectState) {
      StateType? newType = await ContextMenuWidget.show(
          context: context,
          position: details.globalPosition,
          items: generateItems(_manager.selectStateType));
      if (newType != null) {
        _manager.selectStateType = newType;
      }
    }
  }

  List<PopupMenuEntry> generateItems(StateType type) => [
        PopupMenuItem(
            enabled: (type != StateType.start),
            value: StateType.start,
            child: ListTile(
              title: Text(
                "Marcar como estado inicial",
                style: TextStyle(
                    color:
                        (type != StateType.start) ? Colors.black : Colors.grey),
              ),
            )),
        PopupMenuItem(
            enabled: (type != StateType.end),
            value: StateType.end,
            child: ListTile(
              title: Text(
                "Marcar como estado final",
                style: TextStyle(
                    color:
                        (type != StateType.end) ? Colors.black : Colors.grey),
              ),
            )),
        PopupMenuItem(
            enabled: (type != StateType.normal),
            value: StateType.normal,
            child: ListTile(
              title: Text(
                "Marcar como estado normal",
                style: TextStyle(
                    color: (type != StateType.normal)
                        ? Colors.black
                        : Colors.grey),
              ),
            )),
      ];
}
