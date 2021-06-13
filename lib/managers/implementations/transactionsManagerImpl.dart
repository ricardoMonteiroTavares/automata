import 'package:automata/managers/interfaces/transactionsManager.dart';
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
  @override
  @action
  void createNewTransaction(Offset pos) {
    print("Executando: TransactionsManager.createNewTransaction");
    if (_newTransaction == null) {
      print("------------ Criado o objeto ------------");
      String id = uniqueTransactionID;
      _newTransaction = TransactionWidget(id: id, initialPosition: pos);
      _transactions.addAll({id: _newTransaction!});
    }
  }

  @override
  @action
  void updateFinalPositionNewTransaction(Offset finalPosition) {
    print("Executando: TransactionsManager.updateFinalPositionNewTransaction");
    if (_newTransaction != null) {
      _newTransaction!.distance =
          finalPosition - _newTransaction!.initialPosition;
    }
  }

  @override
  @action
  void finishFinalPosition() {
    print("Executando: TransactionsManager.finishFinalPosition");
    if (_newTransaction != null) {
      _newTransaction = null;
    }
  }

  @override
  @action
  void deleteTransaction(String id) {
    print("Executando: TransactionsManager.deleteTransaction");
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
}
