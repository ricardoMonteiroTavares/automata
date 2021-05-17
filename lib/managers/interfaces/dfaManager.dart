import 'package:automata/models/dfa.dart';
import 'package:automata/models/transaction.dart';

/// Classe que manipula um Autômato Finito Determinístico (DFA).
abstract class DFAManager {
  DFA? _dfa;

  /// Gero um novo DFA
  void newDFA();

  /// Adiciona uma nova transação ao DFA.
  ///
  /// Lança uma exceção [ExistingTransactionException] caso a transação [t] já exista no DFA ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void addTransaction(Transaction t);

  /// Modifica uma transação ao DFA.
  ///
  /// Lança uma exceção [NotFoundTransactionException] caso a transação anterior [before] não exista no DFA ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void setTransaction(Transaction before, Transaction after);

  /// Remove uma transação ao DFA.
  ///
  /// Lança uma exceção [NotFoundTransactionException] caso a transação [t] não exista no DFA ou
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
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void addFinalState(String state);

  /// Removo um estado final no DFA.
  ///
  /// Lança uma exceção [NotFoundStateException] caso o estado [state] não exista no DFA ou
  /// caso o DFA não tenha sido criado [NotFoundAutomataException].
  void removeFinalState(String state);

  /// Verifico se existe alguma DFA no manager
  @protected
  bool notExistDFA();
}
