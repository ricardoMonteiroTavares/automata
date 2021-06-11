import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/contextMenuWidget/contextMenuWidget.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'ideWindowController.g.dart';

class IDEWindowController = _IDEWindowController with _$IDEWindowController;

abstract class _IDEWindowController with Store {
  @observable
  GraphicAutomataManager _manager = GraphicAutomataManager();

  @observable
  TransactionWidget? _newTransaction;

  @computed
  List<LayoutId> get objects => _manager.objects;

  @computed
  IDELayoutDelegate get positions => _manager.positions;

  @action
  void onTap(TapDownDetails details) {
    print("Executando: IDEWindowController.onTap");
    Offset position = details.localPosition;

    Either<String, Pair<String, double>> resp = _manager.getState(position);

    resp.fold<void>(
      (l) => _select(l),
      (r) {
        if (_manager.containsSelectState) {
          _unselect();
        } else if (r.right > 60) {
          _add(position);
        }
      },
    );
  }

  @action
  void onStart(DragStartDetails details) {
    print("Executando: IDEWindowController.onStart");
    if (_newTransaction == null) {
      print("------------ Criado o objeto ------------");
      String id = _manager.uniqueTransactionID;
      _newTransaction =
          TransactionWidget(id: id, initialPosition: details.globalPosition);
      _manager.addTransaction(_newTransaction!);
    }
  }

  @action
  void onUpdate(DragUpdateDetails details) {
    print("Executando: IDEWindowController.onUpdate");
    if (_newTransaction != null) {
      _newTransaction!.distance =
          details.globalPosition - _newTransaction!.initialPosition;
    }
  }

  @action
  void onFinish(DragEndDetails details) {
    print("Executando: IDEWindowController.onFinish");
    if (_newTransaction != null) {
      _newTransaction = null;
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
    Either<String, Pair<String, double>> resp =
        _manager.getState(details.localPosition);

    resp.fold(
      (l) async {
        _manager.selectState(l);
        StateType? newType = await ContextMenuWidget.show(
            context: context,
            position: details.globalPosition,
            items: generateItems(_manager.selectStateType));
        if (newType != null) {
          _manager.selectStateType = newType;
        }
      },
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
