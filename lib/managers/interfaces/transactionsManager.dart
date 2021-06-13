import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:automata/managers/implementations/transactionsManagerImpl.dart';

abstract class TransactionsManager {
  factory TransactionsManager() = TransactionsManagerImpl;

  void createNewTransaction(Offset pos);

  void updateFinalPositionNewTransaction(Offset finalPosition);

  void finishFinalPosition();

  void deleteTransaction(String id);

  /// Gero um id único para a nova transação
  String get uniqueTransactionID;

  /// Comando que busca todos os objetos renderizáveis
  List<LayoutId> get objects;

  Map<String, TransactionWidget> get transactions;
}
