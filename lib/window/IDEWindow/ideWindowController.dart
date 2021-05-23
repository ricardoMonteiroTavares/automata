import 'dart:ui';

import 'package:automata/widgets/stateWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'ideWindowController.g.dart';

class IDEWindowController = _IDEWindowController with _$IDEWindowController;

abstract class _IDEWindowController with Store {
  @observable
  ObservableMap<int, StateWidget> _states = ObservableMap<int, StateWidget>();

  @computed
  List<LayoutId> get states =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();

  @observable
  ObservableMap<int, Offset> positions = ObservableMap<int, Offset>();

  @observable
  StateWidgetState? _selectedState;

  @action
  void add(TapDownDetails details) {
    int id = _selectState(details);

    if (id == -1) {
      if (_selectedState != null) {
        _selectedState!.updateColor();
        _selectedState = null;
      } else {
        _addState(details);
      }
    }
  }

  @action
  void delete() {
    if (_selectedState != null) {
      int id = _selectedState!.widget.id;
      _states.remove(id);
      positions.remove(id);
      _selectedState = null;
    }
  }

  @action
  void _addState(TapDownDetails details) {
    int id;
    if (_states.isEmpty) {
      id = 0;
    } else {
      var obj = _states.values.elementAt(_states.length - 1).id;
      id = int.parse(obj.toString()) + 1;
    }
    positions.addAll({id: details.localPosition});
    _states.addAll({
      id: StateWidget(
        id: id,
        name: "q$id",
        onSelect: _selected,
        onDragEnd: _setPosition,
      )
    });
  }

  @action
  int _selectState(TapDownDetails details) {
    Offset click = details.localPosition;

    int id = -1;
    for (int key in positions.keys) {
      Offset statePosition = positions[key]!;
      double distance = (statePosition - click).distance.abs();

      if (distance <= 30) {
        id = key;
        break;
      }
    }

    return id;
  }

  @action
  void _selected(StateWidgetState selected) {
    selected.updateColor();
    if (_selectedState != null) {
      _selectedState!.updateColor();
    }
    _selectedState = selected;
  }

  @action
  void _setPosition(int id, Offset pos) {
    positions[id] = pos;
  }
}
