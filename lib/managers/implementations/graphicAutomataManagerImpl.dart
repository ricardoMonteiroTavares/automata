import 'dart:math';
import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:dartz/dartz.dart';
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
  Either<String, double> getState(Offset position) {
    print("Executando: GraphicAutomataManager.getState");
    double minDistance = double.infinity;
    for (String key in _states.keys) {
      Either<bool, double> resp = _states[key]!.pointIsInState(position);
      if (resp.isLeft()) {
        print("Identificou a key: $key");
        return Left(key);
      } else {
        minDistance =
            resp.foldRight(minDistance, (r, previous) => min(r, previous));
        print("Nova dist??ncia: $minDistance");
      }
    }

    return Right(minDistance);
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
  List<LayoutId> get objects =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();

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
  IDELayoutDelegate get positions => IDELayoutDelegate(states: _states);

  @override
  @computed
  StateType get selectStateType =>
      containsSelectState ? _selectedState!.type : StateType.error;

  @override
  @computed
  set selectStateType(StateType newType) {
    assert(containsSelectState,
        "N??o existe nenhum estado selecionado para trocar o tipo do estado");
    assert(
        newType != StateType.error, "O novo tipo do estado n??o deve ser error");

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
          throw Exception("O novo tipo do estado n??o deve ser error");
      }
      _selectedState!.type = newType;
    } catch (e) {
      throw e;
    }
  }
}
