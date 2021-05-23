// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideWindowController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IDEWindowController on _IDEWindowController, Store {
  Computed<List<LayoutId>>? _$statesComputed;

  @override
  List<LayoutId> get states =>
      (_$statesComputed ??= Computed<List<LayoutId>>(() => super.states,
              name: '_IDEWindowController.states'))
          .value;

  final _$_statesAtom = Atom(name: '_IDEWindowController._states');

  @override
  ObservableMap<int, StateWidget> get _states {
    _$_statesAtom.reportRead();
    return super._states;
  }

  @override
  set _states(ObservableMap<int, StateWidget> value) {
    _$_statesAtom.reportWrite(value, super._states, () {
      super._states = value;
    });
  }

  final _$positionsAtom = Atom(name: '_IDEWindowController.positions');

  @override
  ObservableMap<int, Offset> get positions {
    _$positionsAtom.reportRead();
    return super.positions;
  }

  @override
  set positions(ObservableMap<int, Offset> value) {
    _$positionsAtom.reportWrite(value, super.positions, () {
      super.positions = value;
    });
  }

  final _$_selectedStateAtom =
      Atom(name: '_IDEWindowController._selectedState');

  @override
  StateWidgetState? get _selectedState {
    _$_selectedStateAtom.reportRead();
    return super._selectedState;
  }

  @override
  set _selectedState(StateWidgetState? value) {
    _$_selectedStateAtom.reportWrite(value, super._selectedState, () {
      super._selectedState = value;
    });
  }

  final _$_IDEWindowControllerActionController =
      ActionController(name: '_IDEWindowController');

  @override
  void add(TapDownDetails details) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController.add');
    try {
      return super.add(details);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete() {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController.delete');
    try {
      return super.delete();
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addState(TapDownDetails details) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._addState');
    try {
      return super._addState(details);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  int _selectState(TapDownDetails details) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._selectState');
    try {
      return super._selectState(details);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _selected(StateWidgetState selected) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._selected');
    try {
      return super._selected(selected);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPosition(int id, Offset pos) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._setPosition');
    try {
      return super._setPosition(id, pos);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
positions: ${positions},
states: ${states}
    ''';
  }
}
