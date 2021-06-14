// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionWidgetController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionWidgetController on _TransactionWidgetController, Store {
  Computed<Offset>? _$initialPositionComputed;

  @override
  Offset get initialPosition => (_$initialPositionComputed ??= Computed<Offset>(
          () => super.initialPosition,
          name: '_TransactionWidgetController.initialPosition'))
      .value;
  Computed<Offset>? _$finalPositionComputed;

  @override
  Offset get finalPosition =>
      (_$finalPositionComputed ??= Computed<Offset>(() => super.finalPosition,
              name: '_TransactionWidgetController.finalPosition'))
          .value;

  final _$_initialPositionAtom =
      Atom(name: '_TransactionWidgetController._initialPosition');

  @override
  Offset get _initialPosition {
    _$_initialPositionAtom.reportRead();
    return super._initialPosition;
  }

  @override
  set _initialPosition(Offset value) {
    _$_initialPositionAtom.reportWrite(value, super._initialPosition, () {
      super._initialPosition = value;
    });
  }

  final _$_finalPositionAtom =
      Atom(name: '_TransactionWidgetController._finalPosition');

  @override
  Offset get _finalPosition {
    _$_finalPositionAtom.reportRead();
    return super._finalPosition;
  }

  @override
  set _finalPosition(Offset value) {
    _$_finalPositionAtom.reportWrite(value, super._finalPosition, () {
      super._finalPosition = value;
    });
  }

  final _$_TransactionWidgetControllerActionController =
      ActionController(name: '_TransactionWidgetController');

  @override
  void setInitialPosition(Offset newInitialPosition) {
    final _$actionInfo = _$_TransactionWidgetControllerActionController
        .startAction(name: '_TransactionWidgetController.setInitialPosition');
    try {
      return super.setInitialPosition(newInitialPosition);
    } finally {
      _$_TransactionWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFinalPosition(Offset newDistance) {
    final _$actionInfo = _$_TransactionWidgetControllerActionController
        .startAction(name: '_TransactionWidgetController.setFinalPosition');
    try {
      return super.setFinalPosition(newDistance);
    } finally {
      _$_TransactionWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialPosition: ${initialPosition},
finalPosition: ${finalPosition}
    ''';
  }
}
