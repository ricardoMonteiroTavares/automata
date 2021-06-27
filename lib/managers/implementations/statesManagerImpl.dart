import 'dart:math';

import 'package:automata/enums/stateType.dart';
import 'package:automata/managers/interfaces/statesManager.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'statesManagerImpl.g.dart';

class StatesManagerImpl = _StatesManagerImpl with _$StatesManagerImpl;

abstract class _StatesManagerImpl with Store implements StatesManager {
  @observable
  ObservableMap<String, StateWidget> _states =
      ObservableMap<String, StateWidget>();

  @observable
  StateWidget? _selectedState;

  @override
  @action
  void add(Offset position) {
    print("Executando: StatesManager.add");
    String id = newUniqueID;

    _states.addAll({
      id: StateWidget(
        id: id,
        position: position,
        selectOnDrag: select,
        getState: getState,
      )
    });
  }

  @override
  @action
  void delete(String id) {
    print("Executando: StatesManager.deleteState");
    if (_selectedState != null) {
      String id = _selectedState!.id;
      _states.remove(id);
      _selectedState = null;
    }
  }

  @override
  @action
  Options3<String, double, Pair<String, Offset>> getState(Offset position) {
    print("Executando: StatesManager.getState");
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
  void select(String id) {
    print("Executando: StatesManager.select");
    if (_selectedState == null) {
      _selectedState = _states[id];
    } else if (_selectedState != _states[id]) {
      _selectedState!.unselect();
      _selectedState = _states[id];
    }
    _selectedState!.select();
  }

  @override
  @action
  void unselect() {
    print("Executando: StatesManager.unselect");
    if (_selectedState != null) {
      _selectedState!.unselect();
      _selectedState = null;
    }
  }

  @override
  @computed
  String? get selected => (_selectedState != null) ? _selectedState!.id : null;

  @override
  @computed
  Offset get selectStatePosition => _selectedState!.position;

  @override
  @computed
  StateType get selectStateType =>
      (selected != null) ? _selectedState!.type : StateType.error;

  @override
  @computed
  set selectStateType(StateType newType) {
    assert(selectStateType != StateType.error,
        "Não existe nenhum estado selecionado para trocar o tipo do estado");
    assert(
        newType != StateType.error, "O novo tipo do estado não deve ser error");
    _selectedState!.type = newType;
  }

  @override
  @computed
  String get newUniqueID {
    if (_states.isEmpty) {
      return "q0";
    } else {
      var obj = _states.values.elementAt(_states.length - 1).id;
      return "q${int.parse(obj.toString().substring(1)) + 1}";
    }
  }

  @override
  @computed
  List<LayoutId> get objects =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();
}