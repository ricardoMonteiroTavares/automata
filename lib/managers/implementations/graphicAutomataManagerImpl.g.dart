// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphicAutomataManagerImpl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GraphicAutomataManagerImpl on _GraphicAutomataManagerImpl, Store {
  Computed<List<LayoutId>>? _$objectsComputed;

  @override
  List<LayoutId> get objects =>
      (_$objectsComputed ??= Computed<List<LayoutId>>(() => super.objects,
              name: '_GraphicAutomataManagerImpl.objects'))
          .value;
  Computed<bool>? _$containsSelectStateComputed;

  @override
  bool get containsSelectState => (_$containsSelectStateComputed ??=
          Computed<bool>(() => super.containsSelectState,
              name: '_GraphicAutomataManagerImpl.containsSelectState'))
      .value;
  Computed<IDELayoutDelegate>? _$positionsComputed;

  @override
  IDELayoutDelegate get positions => (_$positionsComputed ??=
          Computed<IDELayoutDelegate>(() => super.positions,
              name: '_GraphicAutomataManagerImpl.positions'))
      .value;

  final _$_statesAtom = Atom(name: '_GraphicAutomataManagerImpl._states');

  @override
  ObservableMap<String, StateWidget> get _states {
    _$_statesAtom.reportRead();
    return super._states;
  }

  @override
  set _states(ObservableMap<String, StateWidget> value) {
    _$_statesAtom.reportWrite(value, super._states, () {
      super._states = value;
    });
  }

  final _$_positionsAtom = Atom(name: '_GraphicAutomataManagerImpl._positions');

  @override
  ObservableMap<String, Offset> get _positions {
    _$_positionsAtom.reportRead();
    return super._positions;
  }

  @override
  set _positions(ObservableMap<String, Offset> value) {
    _$_positionsAtom.reportWrite(value, super._positions, () {
      super._positions = value;
    });
  }

  final _$_selectedStateAtom =
      Atom(name: '_GraphicAutomataManagerImpl._selectedState');

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

  final _$_GraphicAutomataManagerImplActionController =
      ActionController(name: '_GraphicAutomataManagerImpl');

  @override
  void addState(Offset position) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.addState');
    try {
      return super.addState(position);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteState() {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.deleteState');
    try {
      return super.deleteState();
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getState(Offset position) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.getState');
    try {
      return super.getState(position);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPositionState(String id, Offset newPosition) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.setPositionState');
    try {
      return super.setPositionState(id, newPosition);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectState(StateWidgetState state) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.selectState');
    try {
      return super.selectState(state);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectState() {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.unselectState');
    try {
      return super.unselectState();
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
objects: ${objects},
containsSelectState: ${containsSelectState},
positions: ${positions}
    ''';
  }
}
