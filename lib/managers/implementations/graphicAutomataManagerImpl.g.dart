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
  Computed<String?>? _$isSelectedComputed;

  @override
  String? get isSelected =>
      (_$isSelectedComputed ??= Computed<String?>(() => super.isSelected,
              name: '_GraphicAutomataManagerImpl.isSelected'))
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

  final _$_statesManagerAtom =
      Atom(name: '_GraphicAutomataManagerImpl._statesManager');

  @override
  StatesManager get _statesManager {
    _$_statesManagerAtom.reportRead();
    return super._statesManager;
  }

  @override
  set _statesManager(StatesManager value) {
    _$_statesManagerAtom.reportWrite(value, super._statesManager, () {
      super._statesManager = value;
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
  void addTransaction(Pair<String, Offset> startPosition) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.addTransaction');
    try {
      return super.addTransaction(startPosition);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalPosition(Pair<String, Offset> finalPosition) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.updateFinalPosition');
    try {
      return super.updateFinalPosition(finalPosition);
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
  void delete() {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.delete');
    try {
      return super.delete();
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  Options3<String, double, Pair<String, Offset>> obtain(Offset position) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.obtain');
    try {
      return super.obtain(position);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void select(String id) {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.select');
    try {
      return super.select(id);
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselect() {
    final _$actionInfo = _$_GraphicAutomataManagerImplActionController
        .startAction(name: '_GraphicAutomataManagerImpl.unselect');
    try {
      return super.unselect();
    } finally {
      _$_GraphicAutomataManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
objects: ${objects},
isSelected: ${isSelected},
selectStatePosition: ${selectStatePosition},
positions: ${positions},
selectStateType: ${selectStateType}
    ''';
  }
}
