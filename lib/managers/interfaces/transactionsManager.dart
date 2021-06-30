import 'package:automata/models/options3.dart';
import 'package:automata/models/pair.dart';
import 'package:automata/models/transaction.dart';
import 'package:automata/widgets/transactionWdiget/transactionWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:automata/managers/implementations/transactionsManagerImpl.dart';

/// Manipulador de transações
abstract class TransactionsManager {
  factory TransactionsManager() = TransactionsManagerImpl;

  /// Cria uma transação com posição inicial no local especificado [pos]
  void create(Pair<String, Offset> pos);

  /// Atualiza a posição final de uma transação em um local especificado [finalPosition]
  void updateFinalPosition(Pair<String, Offset> finalPosition);

  /// Modifica o código de uma transação
  set transactionCode(String code);

  /// Busca a posição final da nova transação
  Offset get finalPositionNewTransaction;

  /// Gera um model de uma nova transação ou de uma transação selecionada
  Transaction get model;

  /// Finaliza a criação de uma transação
  void finishCreate();

  /// Deleta uma transação através do [id], caso o valor do parâmetro seja [null],
  /// remove-se então a transação que acabou de ser criada
  void delete(String? id);

  /// Deleta todas as transações ligados aos estados [stateID].
  /// Retorna uma lista de models de transações removidas.
  void deleteByID(String stateID);

  /// Seleciono uma transação [id]
  void select(String id);

  /// Seleciono todas as transações que poderão ser reposicionadas
  void selectReposition(String stateID);

  /// Reposiciono os conectores de todas as transações que foram selecionadas 
  /// pela função [selectReposition]
  void updatePosition(Offset delta);

  /// Removo uma seleção
  void unselect();

  /// Verifico se existe uma transação selecionada no manager, se for positivo
  /// retorno o id, caso negativo, retorna null.
  String? get selected;

  /// Gero um id único para a nova transação
  String get uniqueID;

  Options3<String, double, Null> getTransaction(Offset pos);

  /// Comando que busca todos os objetos renderizáveis
  List<LayoutId> get objects;

  Map<String, TransactionWidget> get transactions;
}
