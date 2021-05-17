import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/models/transaction.dart';
import 'package:test/test.dart';

void main() {
  DFAManager obj = DFAManager();
  test('Criar o objeto AFD', () {
    obj.newDFA();

    expect(obj.dfa!.initialState, "");
    expect(obj.dfa!.states, []);
    expect(obj.dfa!.transactions, []);
    expect(obj.dfa!.finalStates, []);
  });

  test('Adicionar estados no AFD', () {
    obj.addState("q0");
    obj.addState("q1");

    expect(obj.dfa!.states.length, 2);
    expect(obj.dfa!.states, ["q0", "q1"]);
  });

  test('Modificar o estado inicial do AFD', () {
    obj.setInitialState("q0");

    expect(obj.dfa!.initialState, "q0");
  });

  test('Adicionar um estado final no AFD', () {
    obj.addFinalState("q1");

    expect(obj.dfa!.finalStates.length, 1);
    expect(obj.dfa!.finalStates, ["q1"]);
  });

  test('Adicionar uma transação', () {
    Transaction t = Transaction(from: "q0", to: "q1", parameter: "0");

    obj.addTransaction(t);

    expect(obj.dfa!.transactions.length, 1);
    expect(obj.dfa!.transactions, ["0"]);
    expect(obj.dfa!.tableTransactions, {
      "q0": {"0": "q1"}
    });
  });

  test('Modificar uma transação já existente', () {
    obj.addState("q2");
    Transaction before = Transaction(from: "q0", to: "q1", parameter: "0");
    Transaction after = Transaction(from: "q0", to: "q2", parameter: "0");

    obj.setTransaction(before, after);

    expect(obj.dfa!.states.length, 3);
    expect(obj.dfa!.states, ["q0", "q1", "q2"]);

    expect(obj.dfa!.transactions.length, 1);
    expect(obj.dfa!.transactions, ["0"]);
    expect(obj.dfa!.tableTransactions, {
      "q0": {"0": "q2"}
    });
  });

  test('Remover uma transação existente na tabela de transações', () {
    Transaction t = Transaction(from: "q0", to: "q2", parameter: "0");
    obj.removeTransaction(t);

    expect(obj.dfa!.transactions.length, 0);
    expect(obj.dfa!.tableTransactions, {"q0": {}});
  });

  test('Remover um estado final', () {
    obj.removeFinalState("q1");

    expect(obj.dfa!.finalStates.length, 0);
  });

  test(
      'Remover um estado sem transações na tabela de transações e que não é estado final',
      () {
    obj.removeState("q2");

    expect(obj.dfa!.states.length, 2);
    expect(obj.dfa!.states, ["q0", "q1"]);
  });

  test(
      'Remover um estado sem transações na tabela de transações e que é estado final',
      () {
    obj.addFinalState("q1");
    obj.removeState("q1");

    expect(obj.dfa!.states.length, 1);
    expect(obj.dfa!.states, ["q0"]);

    expect(obj.dfa!.finalStates.length, 0);
  });

  test(
      'Remover um estado que tem transações na tabela de transações e que é estado inicial',
      () {
    obj.addState("q1");
    Transaction t = Transaction(from: "q0", to: "q1", parameter: "0");
    obj.addTransaction(t);
    obj.removeState("q0");

    expect(obj.dfa!.states.length, 1);
    expect(obj.dfa!.states, ["q1"]);
    expect(obj.dfa!.initialState, "");
    expect(obj.dfa!.transactions.length, 0);
    expect(obj.dfa!.tableTransactions, {});
  });

  test('Remover um estado que tem várias transações na tabela de transações',
      () {
    obj.addState("q0");
    Transaction t = Transaction(from: "q0", to: "q1", parameter: "0");
    obj.addTransaction(t);
    t = Transaction(from: "q1", to: "q0", parameter: "1");
    obj.removeState("q0");

    expect(obj.dfa!.states.length, 1);
    expect(obj.dfa!.states, ["q1"]);
    expect(obj.dfa!.transactions.length, 0);
    expect(obj.dfa!.tableTransactions, {});
  });
}
