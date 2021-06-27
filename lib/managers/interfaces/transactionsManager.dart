import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:automata/managers/implementations/transactionsManagerImpl.dart';

abstract class TransactionsManager {
  factory TransactionsManager() = TransactionsManagerImpl;

  void createNewTransaction(Pair<String, Offset> pos);

  void updateFinalPositionNewTransaction(Pair<String, Offset> finalPosition);

  set newTransactionCode(String code);

  Offset get finalPositionNewTransaction;

  Transaction get generateNewTransactionModel;

  void finishFinalPosition();

  void deleteTransaction(String? id);

  /// Gero um id único para a nova transação
  String get uniqueTransactionID;

  Options3<String, double, Null> getTransaction(Offset pos);

  /// Comando que busca todos os objetos renderizáveis
  List<LayoutId> get objects;

  Map<String, TransactionWidget> get transactions;
}
