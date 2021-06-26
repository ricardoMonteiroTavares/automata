import 'dart:math';
import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/managers/interfaces/transactionsManager.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
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
  ObservableMap<String, StateWidget> _states =
      ObservableMap<String, StateWidget>();

  @observable
  TransactionsManager _transactionsManager = TransactionsManager();

  @observable
  StateWidget? _selectedState;

  @override
  @action
  void addState(Offset position) {
    print("Executando: GraphicAutomataManager.addState");
    String id;
    if (_states.isEmpty) {
      id = "q0";
    } else {
      var obj = _states.values.elementAt(_states.length - 1).id;
      id = "q${int.parse(obj.toString().substring(1)) + 1}";
    }
    _states.addAll({
      id: StateWidget(
        id: id,
        position: position,
        selectOnDrag: selectState,
        getState: getState,
      )
    });
    _dfaManager.addState(id);
  }

  @override
  @action
  void newTransaction(Pair<String, Offset> startPosition) {
    print("Executando: GraphicAutomataManager.newTransaction");
    _transactionsManager.createNewTransaction(startPosition);
  }

  @override
  @action
  void updateFinalPositionNewTransaction(Pair<String, Offset> finalPosition) {
    print(
        "Executando: GraphicAutomataManager.updateFinalPositionNewTransaction");
    _transactionsManager.updateFinalPositionNewTransaction(finalPosition);
  }

  @override
  @action
  void finishFinalPosition() {
    print("Executando: GraphicAutomataManager.finishFinalPosition");
    Options3<String, double, Pair<String, Offset>> resp =
        getState(_transactionsManager.finalPositionNewTransaction);

    if (resp.isRight()) {
      _transactionsManager.updateFinalPositionNewTransaction(resp.right!);
      Transaction t = _transactionsManager.generateNewTransactionModel;
      _dfaManager.addTransaction(t);
      _transactionsManager.finishFinalPosition();
    } else {
      _transactionsManager.deleteTransaction(null);
    }
  }

  @override
  set newTransactionCode(String code) {
    print("Executando: GraphicAutomataManager.set newTransactionCode");
    _transactionsManager.newTransactionCode = code;
  }

  @override
  @action
  void deleteState() {
    print("Executando: GraphicAutomataManager.deleteState");
    if (_selectedState != null) {
      String id = _selectedState!.id;
      _states.remove(id);
      _dfaManager.removeState(id);
      _selectedState = null;
    }
  }

  @override
  @action
  Options3<String, double, Pair<String, Offset>> getState(Offset position) {
    print("Executando: GraphicAutomataManager.getState");
    double minDistance = double.infinity;
    for (String key in _states.keys) {
      Options3<bool, double, Pair<String, Offset>> resp =
          _states[key]!.pointIsInState(position);

      if (resp.isLeft()) {
        print("Identificou a key: $key");
        return LeftOption(key);
      } else if (resp.isMiddle()) {
        minDistance = min(minDistance, resp.middle!);
        print("Nova distância: $minDistance");
      } else {
        return RightOption(resp.right!);
      }
    }

    return MiddleOption(minDistance);
  }

  @override
  @action
  void selectState(String id) {
    print("Executando: GraphicAutomataManager.selectState");
    if (_selectedState == null) {
      _selectedState = _states[id];
    } else if (_selectedState != _states[id]) {
      _selectedState!.unselect();
      _selectedState = _states[id];
    }
    _selectedState!.select();
  }

  @override
  @computed
  List<LayoutId> get objects {
    List<LayoutId> states = _states.entries
        .map((e) => LayoutId(id: e.key, child: e.value))
        .toList();
    List<LayoutId> arrows = _transactionsManager.objects;
    return [...states, ...arrows];
  }

  @override
  @action
  void unselectState() {
    print("Executando: GraphicAutomataManager.unselectState");
    if (_selectedState != null) {
      _selectedState!.unselect();
      _selectedState = null;
    }
  }

  @override
  @computed
  bool get containsSelectState => _selectedState != null;

  @override
  @computed
  Offset get selectStatePosition => _selectedState!.position;

  @override
  @computed
  IDELayoutDelegate get positions => IDELayoutDelegate(
      states: _states, transactions: _transactionsManager.transactions);

  @override
  @computed
  StateType get selectStateType =>
      containsSelectState ? _selectedState!.type : StateType.error;

  @override
  @computed
  set selectStateType(StateType newType) {
    assert(containsSelectState,
        "Não existe nenhum estado selecionado para trocar o tipo do estado");
    assert(
        newType != StateType.error, "O novo tipo do estado não deve ser error");

    try {
      switch (newType) {
        case StateType.start:
          {
            String before = _dfaManager.initialState;
            if (before.isNotEmpty) {
              _states[before]!.type = StateType.normal;
            }
            _dfaManager.setInitialState(_selectedState!.id);
            break;
          }

        case StateType.end:
          {
            _dfaManager.addFinalState(_selectedState!.id);
            break;
          }

        case StateType.normal:
          {
            StateType before = _selectedState!.type;
            if (before == StateType.start) {
              _dfaManager.setInitialState("");
            } else {
              _dfaManager.removeFinalState(_selectedState!.id);
            }
            break;
          }

        default:
          throw Exception("O novo tipo do estado não deve ser error");
      }
      _selectedState!.type = newType;
    } catch (e) {
      throw e;
    }
  }
}
