import 'package:automata/managers/implementations/dfaManagerImpl.dart';
import 'package:automata/models/dfa.dart';
import 'package:automata/models/transaction.dart';
import 'package:flutter/widgets.dart';

/// Classe que manipula um Autômato Finito Determinístico (DFA).
abstract class DFAManager {
  factory DFAManager() = DFAManagerImpl;

  /// Gero um novo DFA
  void newDFA();

  /// Adiciona uma nova transação ao DFA.
  ///
  /// Lança uma exceção [ExistingTransactionException] caso a transação [t] já exista no DFA ou
  /// caso algum dos estados presentes na transação [t] não esteja presente no DFA [NotFoundStateException] ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void addTransaction(Transaction t);

  /// Modifica uma transação ao DFA.
  ///
  /// Lança uma exceção [NotFoundTransactionException] caso a transação anterior [before] não exista no DFA ou
  /// caso algum dos estados presentes nas transações [before][after] não esteja presente no DFA [NotFoundStateException] ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void setTransaction(Transaction before, Transaction after);

  /// Remove uma transação ao DFA.
  ///
  /// Lança uma exceção [NotFoundTransactionException] caso a transação [t] não exista no DFA ou
  /// caso algum dos estados presentes na transação [t] não esteja presente no DFA [NotFoundStateException] ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void removeTransaction(Transaction t);

  /// Adiciona um novo estado no DFA.
  ///
  /// Lança uma exceção [ExistingStateException] caso o estado [state] já exista no DFA ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void addState(String state);

  /// Remove um estado no DFA.
  ///
  /// Lança uma exceção [NotFoundStateException] caso o estado [state] não exista no DFA ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void removeState(String state);

  /// Modifica o estado inicial no DFA.
  ///
  /// Lança uma exceção [NotFoundStateException] caso o estado [state] não exista no DFA ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void setInitialState(String state);

  /// Adiciono um estado final no DFA.
  ///
  /// Lança uma exceção [NotFoundStateException] caso o estado [state] não exista no DFA ou
  /// caso o estado já esteja presente na lista de estados finais [ExistingFinalStateException] ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void addFinalState(String state);

  /// Removo um estado final no DFA.
  ///
  /// Lança uma exceção [NotFoundStateException] caso o estado [state] não exista no DFA ou
  /// caso o estado não esteja presente na lista de estados finais [NotFoundFinalStateException] ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void removeFinalState(String state);

  /// Verifico se não existe alguma DFA no manager
  @protected
  bool notExistDFA();

  /// Verifico se existe um estado no DFA
  @protected
  bool existState(String state);

  /// Remove uma ou mais transações no DFA.
  ///
  /// Caso apenas o campo from esteja preenchido, significa que esta removendo todas as transações
  /// que partem ou chegam no estado a ser removido.
  /// Caso todos os campos estejam preenchidos, signifca que estou removendo uma transação específica
  /// Lança uma exceção [NotFoundTransactionException] caso a transação específica não exista no DFA.
  @protected
  void removeTransactions(String from, [String? to, String? parameter]);

  /// Remove um parâmetro na lista de transações, caso não exista mais nenhuma transação
  /// que utilize o parâmetro informado [parameter];
  @protected
  void removeTransactionsInList(String parameter);

  @visibleForTesting
  DFA? get dfa;
}
