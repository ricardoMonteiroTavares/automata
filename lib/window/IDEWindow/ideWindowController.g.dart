// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideWindowController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IDEWindowController on _IDEWindowController, Store {
  final _$statesAtom = Atom(name: '_IDEWindowController.states');

  @override
  ObservableList<LayoutId> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(ObservableList<LayoutId> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
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

  final _$_IDEWindowControllerActionController =
      ActionController(name: '_IDEWindowController');

  @override
  void addState(TapDownDetails details) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController.addState');
    try {
      return super.addState(details);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
states: ${states},
positions: ${positions}
    ''';
  }
}
