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
  Computed<Offset>? _$selectStatePositionComputed;

  @override
  Offset get selectStatePosition => (_$selectStatePositionComputed ??=
          Computed<Offset>(() => super.selectStatePosition,
              name: '_GraphicAutomataManagerImpl.selectStatePosition'))
      .value;
  Computed<IDELayoutDelegate>? _$positionsComputed;

  @override
  IDELayoutDelegate get positions => (_$positionsComputed ??=
          Computed<IDELayoutDelegate>(() => super.positions,
              name: '_GraphicAutomataManagerImpl.positions'))
      .value;
  Computed<StateType>? _$selectStateTypeComputed;

  @override
  StateType get selectStateType => (_$selectStateTypeComputed ??=
          Computed<StateType>(() => super.selectStateType,
              name: '_GraphicAutomataManagerImpl.selectStateType'))
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

  final _$_transactionsManagerAtom =
      Atom(name: '_GraphicAutomataManagerImpl._transactionsManager');

  @override
  TransactionsManager get _transactionsManager {
    _$_transactionsManagerAtom.reportRead();
    return super._transactionsManager;
  }

  @override
  set _transactionsManager(TransactionsManager value) {
    _$_transactionsManagerAtom.reportWrite(value, super._transactionsManager,
        () {
      super._transactionsManager = value;
    });
  }

  final _$_selectedStateAtom =
      Atom(name: '_GraphicAutomataManagerImpl._selectedState');

  @override
  StateWidget? get _selectedState {
    _$_selectedStateAtom.reportRead();
    return super._selectedState;
  }

  @override
  set _selectedState(StateWidget? value) {
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
  void newTransaction(Offset startPosition) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.newTransaction');
    try {
      return super.newTransaction(startPosition);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalPositionNewTransaction(Offset finalPosition) {
    final _$actionInfo =
        _$_GraphicAutomataManagerImplActionController.startAction(
            name:
                '_GraphicAutomataManagerImpl.updateFinalPositionNewTransaction');
    try {
      return super.updateFinalPositionNewTransaction(finalPosition);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishFinalPosition() {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.finishFinalPosition');
    try {
      return super.finishFinalPosition();
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
  Options3<String, double, Offset> getState(Offset position) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.getState');
    try {
      return super.getState(position);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectState(String id) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.selectState');
    try {
      return super.selectState(id);
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
selectStatePosition: ${selectStatePosition},
positions: ${positions},
selectStateType: ${selectStateType}
    ''';
  }
}
