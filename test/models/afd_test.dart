import 'package:automata/models/dfa.dart';
import 'package:test/test.dart';

void main() {
  DFA obj = DFA();
  test('Criar o objeto AFD', () {
    expect(obj.initialState, "");
    expect(obj.states, []);
    expect(obj.transactions, []);
    expect(obj.finalStates, []);
  });

  test('Modificar o estado inicial', () {
    obj.initialState = "q0";
    expect(obj.initialState, "q0");
  });

  test('Modificar a lista de estados finais', () {
    obj.finalStates = ["q1"];
    expect(obj.finalStates.length, 1);
    expect(obj.finalStates, ["q1"]);
  });

  test('Modificar a lista de estados', () {
    obj.states = ["q0", "q1"];
    expect(obj.states.length, 2);
    expect(obj.states, ["q0", "q1"]);
  });

  test('Modificar a lista de transações', () {
    obj.transactions = ["0"];
    expect(obj.transactions.length, 1);
    expect(obj.transactions, ["0"]);
  });

  test('Modificar a tabela de transações', () {
    obj.tableTransactions = {
      "q0": {"0": "q1"}
    };
    expect(obj.tableTransactions, {
      "q0": {"0": "q1"}
    });
  });
}
