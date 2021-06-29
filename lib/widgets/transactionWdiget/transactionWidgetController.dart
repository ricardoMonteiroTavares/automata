import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'transactionWidgetController.g.dart';

class TransactionWidgetController = _TransactionWidgetController
    with _$TransactionWidgetController;

abstract class _TransactionWidgetController with Store {
  @observable
  Pair<String, Offset> _initialPosition = Pair("", Offset(0, 0));

  @observable
  Pair<String, Offset> _finalPosition = Pair("", Offset(0, 0));

  @observable
  String _keyCode = "";

  @observable
  Color _color = Colors.black;

  @action
  void setInitialPosition(Pair<String, Offset> newInitialPosition) {
    _initialPosition = newInitialPosition;
  }

  @computed
  Offset get initialPosition => _initialPosition.right;

  @action
  void setFinalPosition(Pair<String, Offset> newFinalPosition) {
    _finalPosition = newFinalPosition;
  }

  @computed
  Offset get finalPosition => _finalPosition.right;

  @action
  void setKeyCode(String newCode) {
    _keyCode = newCode;
  }

  @computed
  Color get color => _color;

  @action
  void select() {
    _color = Colors.blue;
  }

  @action
  void unselect() {
    _color = Colors.black;
  }

  bool belongsState(String stateID) =>
      (_initialPosition.left == stateID) || (_finalPosition.left == stateID);

  @computed
  String get keyCode => _keyCode;

  @computed
  Transaction get generateModel => Transaction(
      from: _initialPosition.left, to: _finalPosition.left, parameter: keyCode);
}
