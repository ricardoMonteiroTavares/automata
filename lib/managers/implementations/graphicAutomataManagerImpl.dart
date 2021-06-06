import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
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
  ObservableMap<String, Offset> _positions = ObservableMap<String, Offset>();

  @observable
  StateWidgetState? _selectedState;

  @override
  @action
  void addState(Offset position) {
    String id;
    if (_states.isEmpty) {
      id = "q0";
    } else {
      var obj = _states.values.elementAt(_states.length - 1).id;
      id = "q${int.parse(obj.toString().substring(1)) + 1}";
    }
    _positions.addAll({id: position});
    _states.addAll({
      id: StateWidget(
        id: id,
        onSelect: selectState,
        onDragEnd: setPositionState,
      )
    });
    _dfaManager.addState(id);
  }

  @override
  @action
  void deleteState() {
    if (_selectedState != null) {
      String id = _selectedState!.widget.id;
      _states.remove(id);
      _positions.remove(id);
      _dfaManager.removeState(id);
      _selectedState = null;
    }
  }

  @override
  @action
  String getState(Offset position) {
    String id = "";
    for (String key in _positions.keys) {
      Offset statePosition = _positions[key]!;
      double distance = (statePosition - position).distance.abs();

      if (distance <= 30) {
        id = key;
        break;
      }
    }

    return id;
  }

  @override
  @action
  void setPositionState(String id, Offset newPosition) {
    _positions[id] = newPosition;
  }

  @override
  @action
  void selectState(StateWidgetState state) {
    if (_selectedState == null) {
      _selectedState = state;
    } else if (_selectedState != state) {
      _selectedState!.unselect();
      _selectedState = state;
    }
  }

  @override
  @computed
  List<LayoutId> get objects =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();

  @override
  @action
  void unselectState() {
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
  IDELayoutDelegate get positions => IDELayoutDelegate(positions: _positions);

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
    
    _selectedState!.type = newType;
  }
}
