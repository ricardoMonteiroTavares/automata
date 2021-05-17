import 'package:automata/managers/interfaces/dfaManager.dart';
import 'package:automata/exceptions/exceptions.dart';
import 'package:automata/models/transaction.dart';
import 'package:test/test.dart';

void main() {
  DFAManager obj = DFAManager();

  test('Realizar qualquer operação sem ter gerado AFD antes', () {
    expect(() => obj.addState("q0"),
        throwsA(TypeMatcher<NotFoundAutomataException>()));
  });

  test('Remover um estado inexistente', () {
    obj.newDFA();
    expect(() => obj.removeState("q0"),
        throwsA(TypeMatcher<NotFoundStateException>()));
  });

  test('Adicionar um estado já existente', () {
    obj.addState("q0");
    expect(() => obj.addState("q0"),
        throwsA(TypeMatcher<ExistingStateException>()));
  });

  test('Remoção de um estado final inexistente', () {
    expect(() => obj.removeFinalState("q0"),
        throwsA(TypeMatcher<NotFoundFinalStateException>()));
  });

  test('Adicionar de um estado final já existente', () {
    obj.addState("q1");
    obj.addFinalState("q1");
    expect(() => obj.addFinalState("q1"),
        throwsA(TypeMatcher<ExistingFinalStateException>()));
  });

  test('Remover uma transação inexistente', () {
    Transaction t = Transaction(from: "q0", to: "q1", parameter: "0");

    expect(() => obj.removeTransaction(t),
        throwsA(TypeMatcher<NotFoundTransactionException>()));
  });

  test('Adicionar uma transação já existente', () {
    Transaction t = Transaction(from: "q0", to: "q1", parameter: "0");
    obj.addTransaction(t);
    expect(() => obj.addTransaction(t),
        throwsA(TypeMatcher<ExistingTransactionException>()));
  });
}
