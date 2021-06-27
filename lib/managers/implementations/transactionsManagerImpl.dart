import 'dart:math';

import 'package:automata/managers/interfaces/transactionsManager.dart';
import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'transactionsManagerImpl.g.dart';

class TransactionsManagerImpl = _TransactionsManagerImpl
    with _$TransactionsManagerImpl;

abstract class _TransactionsManagerImpl
    with Store
    implements TransactionsManager {
  @observable
  ObservableMap<String, TransactionWidget> _transactions =
      ObservableMap<String, TransactionWidget>();

  @observable
  TransactionWidget? _newTransaction;

  @observable
  TransactionWidget? _selected;

  @override
  @action
  void createNewTransaction(Pair<String, Offset> pos) {
    print("Executando: TransactionsManager.createNewTransaction");
    if (_newTransaction == null) {
      print("------------ Criado o objeto ------------");
      String id = uniqueTransactionID;
      _newTransaction = TransactionWidget(id: id, initPosition: pos);
      _transactions.addAll({id: _newTransaction!});
    }
  }

  @override
  @action
  void updateFinalPositionNewTransaction(Pair<String, Offset> finalPosition) {
    print("Executando: TransactionsManager.updateFinalPositionNewTransaction");
    if (_newTransaction != null) {
      _newTransaction!.setFinalPosition(finalPosition);
    }
  }

  @override
  @action
  Options3<String, double, Null> getTransaction(Offset pos) {
    if (_newTransaction == null) {
      print("Executando: TransactionsManager.getTransaction");
      double minAngle = double.infinity;
      for (String key in _transactions.keys) {
        Offset v1 = _transactions[key]!.finalPosition -
            _transactions[key]!.initialPosition;

        Offset v2 = pos - _transactions[key]!.initialPosition;

        double resp = ((v1.dx * v2.dx) + (v1.dy * v2.dy)) /
            (sqrt((pow(v1.dx, 2) + pow(v1.dy, 2))) *
                sqrt((pow(v2.dx, 2) + pow(v2.dy, 2))));

        resp = acos(resp);

        if (resp >= 0 && resp <= 1) {
          print("Identificou a key: $key");
          return LeftOption(key);
        } else {
          minAngle = min(minAngle, resp);
          print("Nova distância: $minAngle");
        }
      }

      return MiddleOption(minAngle);
    }
    return RightOption(null);
  }

  @override
  @computed
  Transaction get generateNewTransactionModel => _newTransaction!.generateModel;

  @override
  @action
  void finishFinalPosition() {
    print("Executando: TransactionsManager.finishFinalPosition");
    if (_newTransaction != null) {
      _newTransaction = null;
    }
  }

  @override
  set newTransactionCode(String code) {
    print("Executando: TransactionsManager.set newTransactionCode");
    _newTransaction!.keyCode = code;
  }

  @override
  @action
  void deleteTransaction(String? id) {
    print("Executando: TransactionsManager.deleteTransaction");
    if (id != null) {
      print("Removendo transação de id = $id");
      _transactions.remove(id);
    } else if (_newTransaction != null) {
      print(
          "Cancelando a inserção da transação de id = ${_newTransaction!.id}");
      _transactions.remove(_newTransaction!.id);
      _newTransaction = null;
    }
  }

  @override
  @computed
  String get uniqueTransactionID {
    print("Executando: TransactionsManager.get uniqueTransactionID");
    String id;
    if (_transactions.isEmpty) {
      id = "t0";
    } else {
      var obj = _transactions.values.elementAt(_transactions.length - 1).id;
      id = "t${int.parse(obj.toString().substring(1)) + 1}";
    }
    return id;
  }

  @override
  @computed
  List<LayoutId> get objects => _transactions.entries
      .map((e) => LayoutId(id: e.key, child: e.value))
      .toList();

  @override
  @computed
  Map<String, TransactionWidget> get transactions => _transactions;

  @override
  @computed
  Offset get finalPositionNewTransaction => _newTransaction!.finalPosition;
}
