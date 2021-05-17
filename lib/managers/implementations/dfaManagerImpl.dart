import 'package:automata/exceptions/notFoundFinalStateException.dart';
import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/models/dfa.dart';
import 'package:automata/models/transaction.dart';
import 'package:automata/exceptions/exceptions.dart';

class DFAManagerImpl implements DFAManager {
  DFA? _dfa;

  @override
  void addFinalState(String state) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if (!existState(state)) {
      throw NotFoundStateException();
    } else if (_dfa!.finalStates.indexOf(state) != -1) {
      throw ExistingFinalStateException();
    }

    _dfa!.finalStates.add(state);
  }

  @override
  void addState(String state) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if (existState(state)) {
      throw ExistingStateException();
    }

    _dfa!.states.add(state);
  }

  @override
  void addTransaction(Transaction t) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if ((!existState(t.from)) || (!existState(t.to))) {
      throw NotFoundStateException();
    }

    if (_dfa!.tableTransactions.containsKey(t.from)) {
      if (_dfa!.tableTransactions[t.from]!.containsKey(t.parameter)) {
        throw ExistingTransactionException();
      }

      _dfa!.tableTransactions[t.from]!.addAll({t.parameter: t.to});
    } else {
      _dfa!.tableTransactions.addAll({
        t.from: {t.parameter: t.to}
      });
    }

    if (_dfa!.transactions.indexOf(t.parameter) == -1) {
      _dfa!.transactions.add(t.parameter);
    }
  }

  @override
  void newDFA() {
    if (notExistDFA()) {
      _dfa = DFA();
    }
  }

  @override
  void removeFinalState(String state) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if (!existState(state)) {
      throw NotFoundStateException();
    } else if (_dfa!.finalStates.indexOf(state) == -1) {
      throw NotFoundFinalStateException();
    }

    _dfa!.finalStates.remove(state);
  }

  @override
  void removeState(String state) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if (!existState(state)) {
      throw NotFoundStateException();
    }
    try {
      removeFinalState(state);
    } catch (e) {}

    try {
      removeTransactions(state);
    } catch (e) {}

    _dfa!.states.remove(state);

    if (_dfa!.initialState == state) {
      _dfa!.initialState = "";
    }
  }

  @override
  void removeTransaction(Transaction t) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if ((!existState(t.from)) || (!existState(t.to))) {
      throw NotFoundStateException();
    }

    try {
      removeTransactions(t.from, t.to, t.parameter);
    } catch (e) {
      throw e;
    }
  }

  @override
  void setInitialState(String state) {
    if (notExistDFA()) {
      throw NotFoundAutomataException();
    } else if (!existState(state)) {
      throw NotFoundStateException();
    }

    _dfa!.initialState = state;
  }

  @override
  void setTransaction(Transaction before, Transaction after) {
    try {
      removeTransaction(before);
      addTransaction(after);
    } catch (e) {
      throw e;
    }
  }

  @override
  bool notExistDFA() => _dfa == null;

  @override
  bool existState(String state) => _dfa!.states.indexOf(state) != -1;

  @override
  DFA? get dfa => _dfa;

  @override
  void removeTransactions(String from, [String? to, String? parameter]) {
    if (to != null && parameter != null) {
      if (_dfa!.tableTransactions.containsKey(from) &&
          _dfa!.tableTransactions[from]!.containsKey(parameter) &&
          (_dfa!.tableTransactions[from]![parameter]! == to)) {
        _dfa!.tableTransactions[from]!.remove(parameter);
      } else {
        throw NotFoundTransactionException();
      }
      removeTransactionsInList(parameter);
    } else {
      if (_dfa!.tableTransactions.containsKey(from)) {
        Map<String, String> mapFrom = _dfa!.tableTransactions[from]!;
        _dfa!.tableTransactions.remove(from);

        for (Map<String, String> val in _dfa!.tableTransactions.values) {
            val.removeWhere((key, value) => value == from);
        }

        for (String key in mapFrom.keys) {
          removeTransactionsInList(key);
        }
      }
    }
  }

  @override
  void removeTransactionsInList(String parameter) {
    if (_dfa!.transactions.indexOf(parameter) != -1) {
      bool flag = false;
      for (Map<String, String> val in _dfa!.tableTransactions.values) {
        if (val.containsKey(parameter)) {
          flag = true;
          break;
        }
      }
      if (!flag) {
        _dfa!.transactions.remove(parameter);
      }
    }
  }
}
