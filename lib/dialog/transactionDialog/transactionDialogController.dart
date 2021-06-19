import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'transactionDialogController.g.dart';

class TransactionDialogController = _TransactionDialogController
    with _$TransactionDialogController;

abstract class _TransactionDialogController with Store {
  @observable
  String? _key;

  @action
  void keyPressed(RawKeyEvent key) {
    if (key.character != null) {
      print(
          "Executando: TransactionDialogController.keyPressed(${key.character})");
      _key = key.character;
    }
  }

  String? get key => _key;
}
