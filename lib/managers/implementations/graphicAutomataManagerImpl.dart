import 'dart:ui';

import 'package:automata/layout/ideLayoutDelegate.dart';
import 'package:automata/managers/interfaces/graphicAutomataManager.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/src/widgets/basic.dart';

class GraphicAutomataManagerImpl implements GraphicAutomataManager {
  // Dados
  Map<String, StateWidget> _states = Map<String, StateWidget>();
  Map<String, Offset> _positions = Map<String, Offset>();
  StateWidgetState? _selectedState;

  @override
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
  void deleteState() {
    if (_selectedState != null) {
      String id = _selectedState!.widget.id;
      _states.remove(id);
      _positions.remove(id);
      _selectedState = null;
    }
  }

  @override
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
  void setPositionState(String id, Offset newPosition) {
    _positions[id] = newPosition;
  }

  @override
  void selectState(StateWidgetState state) {
    if (_selectedState == null) {
      _selectedState = state;
    } else if (_selectedState != state) {
      _selectedState!.unselect();
      _selectedState = state;
    }
  }

  @override
  List<LayoutId> get objects =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();

  @override
  void unselectState() {
    if (_selectedState != null) {
      _selectedState!.unselect();
      _selectedState = null;
    }
  }

  @override
  bool get containsSelectState => _selectedState != null;

  @override
  IDELayoutDelegate get positions => IDELayoutDelegate(positions: _positions);
}
