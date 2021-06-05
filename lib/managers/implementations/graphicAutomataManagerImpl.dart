import 'dart:ui';

import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:mobx/mobx.dart';

part 'graphicAutomataManagerImpl.g.dart';

class GraphicAutomataManagerImpl = _GraphicAutomataManagerImpl
    with _$GraphicAutomataManagerImpl;

abstract class _GraphicAutomataManagerImpl
    with Store
    implements GraphicAutomataManager {
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
  }

  @override
  @action
  void deleteState() {
    if (_selectedState != null) {
      String id = _selectedState!.widget.id;
      _states.remove(id);
      _positions.remove(id);
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
}
