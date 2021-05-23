import 'dart:ui';

import 'package:automata/enums/stateType.dart';
import 'package:automata/widgets/stateWidget/stateWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'ideWindowController.g.dart';

class IDEWindowController = _IDEWindowController with _$IDEWindowController;

abstract class _IDEWindowController with Store {
  @observable
  ObservableMap<String, StateWidget> _states =
      ObservableMap<String, StateWidget>();

  @computed
  List<LayoutId> get states =>
      _states.entries.map((e) => LayoutId(id: e.key, child: e.value)).toList();

  @observable
  ObservableMap<String, Offset> positions = ObservableMap<String, Offset>();

  @observable
  StateWidgetState? _selectedState;

  @action
  void add(TapDownDetails details) {
    String id = _selectState(details);

    if (id.isEmpty) {
      if (_selectedState != null) {
        _selectedState!.unselect();
        _selectedState = null;
      } else {
        _addState(details);
      }
    }
  }

  @action
  void delete() {
    if (_selectedState != null) {
      String id = _selectedState!.widget.id;
      _states.remove(id);
      positions.remove(id);
      _selectedState = null;
    }
  }

  @action
  void _addState(TapDownDetails details) {
    String id;
    if (_states.isEmpty) {
      id = "q0";
    } else {
      var obj = _states.values.elementAt(_states.length - 1).id;
      id = "q${int.parse(obj.toString().substring(1)) + 1}";
    }
    positions.addAll({id: details.localPosition});
    _states.addAll({
      id: StateWidget(
        id: id,
        type: StateType.start,
        onSelect: _selected,
        onDragEnd: _setPosition,
      )
    });
  }

  @action
  String _selectState(TapDownDetails details) {
    Offset click = details.localPosition;

    String id = "";
    for (String key in positions.keys) {
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
    if (_selectedState == null) {
      _selectedState = selected;
    } else if (_selectedState != selected) {
      _selectedState!.unselect();
      _selectedState = selected;
    }
  }

  @action
  void _setPosition(String id, Offset pos) {
    positions[id] = pos;
  }
}
