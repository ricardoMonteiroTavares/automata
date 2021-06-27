// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statesManagerImpl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesManagerImpl on _StatesManagerImpl, Store {
  Computed<String?>? _$selectedComputed;

  @override
  String? get selected =>
      (_$selectedComputed ??= Computed<String?>(() => super.selected,
              name: '_StatesManagerImpl.selected'))
          .value;
  Computed<Offset>? _$selectStatePositionComputed;

  @override
  Offset get selectStatePosition => (_$selectStatePositionComputed ??=
          Computed<Offset>(() => super.selectStatePosition,
              name: '_StatesManagerImpl.selectStatePosition'))
      .value;
  Computed<StateType>? _$selectStateTypeComputed;

  @override
  StateType get selectStateType => (_$selectStateTypeComputed ??=
          Computed<StateType>(() => super.selectStateType,
              name: '_StatesManagerImpl.selectStateType'))
      .value;
  Computed<String>? _$newUniqueIDComputed;

  @override
  String get newUniqueID =>
      (_$newUniqueIDComputed ??= Computed<String>(() => super.newUniqueID,
              name: '_StatesManagerImpl.newUniqueID'))
          .value;
  Computed<List<LayoutId>>? _$objectsComputed;

  @override
  List<LayoutId> get objects =>
      (_$objectsComputed ??= Computed<List<LayoutId>>(() => super.objects,
              name: '_StatesManagerImpl.objects'))
          .value;

  final _$_statesAtom = Atom(name: '_StatesManagerImpl._states');

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

  final _$_selectedStateAtom = Atom(name: '_StatesManagerImpl._selectedState');

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

  final _$_StatesManagerImplActionController =
      ActionController(name: '_StatesManagerImpl');

  @override
  void add(Offset position) {
    final _$actionInfo = _$_StatesManagerImplActionController.startAction(
        name: '_StatesManagerImpl.add');
    try {
      return super.add(position);
    } finally {
      _$_StatesManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(String id) {
    final _$actionInfo = _$_StatesManagerImplActionController.startAction(
        name: '_StatesManagerImpl.delete');
    try {
      return super.delete(id);
    } finally {
      _$_StatesManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  Options3<String, double, Pair<String, Offset>> getState(Offset position) {
    final _$actionInfo = _$_StatesManagerImplActionController.startAction(
        name: '_StatesManagerImpl.getState');
    try {
      return super.getState(position);
    } finally {
      _$_StatesManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void select(String id) {
    final _$actionInfo = _$_StatesManagerImplActionController.startAction(
        name: '_StatesManagerImpl.select');
    try {
      return super.select(id);
    } finally {
      _$_StatesManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselect() {
    final _$actionInfo = _$_StatesManagerImplActionController.startAction(
        name: '_StatesManagerImpl.unselect');
    try {
      return super.unselect();
    } finally {
      _$_StatesManagerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
selectStatePosition: ${selectStatePosition},
selectStateType: ${selectStateType},
newUniqueID: ${newUniqueID},
objects: ${objects}
    ''';
  }
}
