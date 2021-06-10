// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionWidgetController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionWidgetController on _TransactionWidgetController, Store {
  final _$initialPositionAtom =
      Atom(name: '_TransactionWidgetController.initialPosition');

  @override
  Offset get initialPosition {
    _$initialPositionAtom.reportRead();
    return super.initialPosition;
  }

  @override
  set initialPosition(Offset value) {
    _$initialPositionAtom.reportWrite(value, super.initialPosition, () {
      super.initialPosition = value;
    });
  }

  final _$distanceAtom = Atom(name: '_TransactionWidgetController.distance');

  @override
  Offset get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(Offset value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  @override
  String toString() {
    return '''
initialPosition: ${initialPosition},
distance: ${distance}
    ''';
  }
}
