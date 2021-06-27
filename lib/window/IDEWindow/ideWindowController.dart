import 'dart:ui';

import 'package:automata/dialog/transactionDialog/transactionDialog.dart';
import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
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
    print("Executando: IDEWindowController.onTap");
    Offset position = details.localPosition;

    Options3<String, double, Pair<String, Offset>> resp =
        _manager.obtain(position);

    resp.fold<void>(
      (l) => _select(l),
      (m) {
        if (_manager.isSelected != null) {
          _unselect();
        } else if (m > 60) {
          _add(position);
        }
      },
      (r) => _manager.addTransaction(r),
    );
  }

  @action
  void onUpdate(DragUpdateDetails details) {
    print("Executando: IDEWindowController.onUpdate");
    _manager.updateFinalPosition(Pair("", details.localPosition));
  }

  @action
  Future<void> onFinish(DragEndDetails details, BuildContext context) async {
    print("Executando: IDEWindowController.onFinish");

    String key = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => TransactionDialog());
    _manager.newTransactionCode = key;
    _manager.finishFinalPosition();
    print("Chave selecionada: $key");
  }

  @action
  void _add(Offset position) {
    _manager.addState(position);
  }

  @action
  void _select(String id) {
    _unselect();
    _manager.select(id);
  }

  @action
  void _unselect() {
    _manager.unselect();
  }

  @action
  void delete() {
    _manager.delete();
  }

  Future<void> contextMenu(TapDownDetails details, BuildContext context) async {
    Options3<String, double, Pair<String, Offset>> resp =
        _manager.obtain(details.localPosition);

    resp.fold(
      (l) async {
        _manager.select(l);
        StateType? newType = await ContextMenuWidget.show(
            context: context,
            position: details.globalPosition,
            items: generateItems(_manager.selectStateType));
        if (newType != null) {
          _manager.selectStateType = newType;
        }
      },
      (m) => null,
      (r) => null,
    );
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
