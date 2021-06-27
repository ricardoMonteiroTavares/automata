import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/exceptions/exceptions.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/managers/interfaces/statesManager.dart';
import 'package:automata/managers/interfaces/transactionsManager.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'graphicAutomataManagerImpl.g.dart';

class GraphicAutomataManagerImpl extends _GraphicAutomataManagerImpl
    with _$GraphicAutomataManagerImpl {
  GraphicAutomataManagerImpl() {
    super._dfaManager = DFAManager();
    super._dfaManager.newDFA();
  }
}

abstract class _GraphicAutomataManagerImpl
    with Store
    implements GraphicAutomataManager {
  // Automato
  late DFAManager _dfaManager;
  // Dados
  @observable
  StatesManager _statesManager = StatesManager();

  @observable
  TransactionsManager _transactionsManager = TransactionsManager();

  @override
  @action
  void addState(Offset position) {
    print("Executando: GraphicAutomataManager.addState");
    String id = _statesManager.add(position);
    _dfaManager.addState(id);
  }

  @override
  @action
  void addTransaction(Pair<String, Offset> startPosition) {
    print("Executando: GraphicAutomataManager.addTransaction");
    _transactionsManager.create(startPosition);
  }

  @override
  @action
  void updateFinalPosition(Pair<String, Offset> finalPosition) {
    print("Executando: GraphicAutomataManager.updateFinalPosition");
    _transactionsManager.updateFinalPosition(finalPosition);
  }

  @override
  @action
  void finishFinalPosition() {
    print("Executando: GraphicAutomataManager.finishFinalPosition");
    Options3<String, double, Pair<String, Offset>> resp =
        obtain(_transactionsManager.finalPositionNewTransaction);

    if (resp.isRight()) {
      updateFinalPosition(resp.right!);
      Transaction t = _transactionsManager.model;
      _dfaManager.addTransaction(t);
      _transactionsManager.finishCreate();
    } else {
      _transactionsManager.delete(null);
    }
  }

  @override
  set newTransactionCode(String code) {
    print("Executando: GraphicAutomataManager.set newTransactionCode");
    _transactionsManager.transactionCode = code;
  }

  @override
  @action
  void delete() {
    print("Executando: GraphicAutomataManager.delete");
    String? id = _statesManager.selected;
    if (id != null) {
      _statesManager.delete(id);
      _dfaManager.removeState(id);
    }
    // TODO: Implementar a remoção de uma transação
  }

  @override
  @action
  Options3<String, double, Pair<String, Offset>> obtain(Offset position) {
    print("Executando: GraphicAutomataManager.obtain");
    // TODO: Ver caso onde a transação aponta para ele mesmo
    if (_statesManager.len > 1) {
      Options3<String, double, Null> response =
          _transactionsManager.getTransaction(position);

      if (response.isLeft()) {
        return LeftOption(response.left!);
      }
    }
    return _statesManager.getState(position);
  }

  @override
  @action
  void select(String id) {
    print("Executando: GraphicAutomataManager.select");
    if (id[0] == "q") {
      _statesManager.select(id);
    }

    // TODO: Implementar a seleção de uma transação
  }

  @override
  @computed
  List<LayoutId> get objects {
    List<LayoutId> states = _statesManager.objects;
    List<LayoutId> arrows = _transactionsManager.objects;
    return [...states, ...arrows];
  }

  @override
  @action
  void unselect() {
    print("Executando: GraphicAutomataManager.unselect");
    _statesManager.unselect();
    // TODO: Implementar a deseleção de uma transação
  }

  @override
  @computed
  String? get isSelected =>
      _statesManager.selected; // TODO: Verificar se selecionei uma transação

  @override
  @computed
  Offset get selectStatePosition => _statesManager.selectStatePosition;

  @override
  @computed
  IDELayoutDelegate get positions => IDELayoutDelegate(
      states: _statesManager.states,
      transactions: _transactionsManager.transactions);

  @override
  @computed
  StateType get selectStateType => _statesManager.selectStateType;

  @override
  @computed
  set selectStateType(StateType newType) {
    if (_statesManager.selected == null) {
      throw NotFoundStateException();
    }
    if (newType == StateType.error) {
      throw StateTypeException();
    }

    try {
      switch (newType) {
        case StateType.start:
          {
            String before = _dfaManager.initialState;
            if (before.isNotEmpty) {
              _statesManager.setStateType(before, StateType.normal);
            }
            _dfaManager.setInitialState(_statesManager.selected!);
            break;
          }

        case StateType.end:
          {
            _dfaManager.addFinalState(_statesManager.selected!);
            break;
          }

        case StateType.normal:
          {
            StateType before = _statesManager.selectStateType;
            if (before == StateType.start) {
              _dfaManager.setInitialState("");
            } else {
              _dfaManager.removeFinalState(_statesManager.selected!);
            }
            break;
          }

        default:
          throw StateTypeException();
      }
      _statesManager.setStateType(_statesManager.selected!, newType);
    } catch (e) {
      throw e;
    }
  }
}
