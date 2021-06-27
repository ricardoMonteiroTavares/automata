import 'dart:math';

import 'package:automata/enums/stateType.dart';
import 'package:automata/exceptions/exceptions.dart';
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
  String add(Offset position) {
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

    return id;
  }

  @override
  @action
  void delete(String id) {
    print("Executando: StatesManager.delete");
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
    if (!_states.containsKey(id)) {
      throw NotFoundStateException();
    }
    if (_selectedState != null && _selectedState != _states[id]) {
      _selectedState!.unselect();
    }
    _selectedState = _states[id];
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
  void setStateType(String id, StateType newType) {
    print("Executando: StatesManager.setStateType");
    if (!_states.containsKey(id)) {
      throw NotFoundStateException();
    }
    if (newType == StateType.error) {
      throw StateTypeException();
    }
    _states[id]!.type = newType;
  }

  @override
  @computed
  String get newUniqueID {
    print("Executando: StatesManager.newUniqueID");
    if (_states.isEmpty) {
      return "q0";
    } else {
      var obj = _states.values.elementAt(_states.length - 1).id;
      return "q${int.parse(obj.toString().substring(1)) + 1}";
    }
  }

  @override
  @computed
  int get len => _states.length;

  @override
  @computed
  List<LayoutId> get objects =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();

  @override
  @computed
  Map<String, StateWidget> get states => _states;
}
