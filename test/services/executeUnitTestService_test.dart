import 'package:automata/enums/resultTest.dart';
import 'package:automata/models/dfa.dart';
import 'package:automata/models/unitTest.dart';
import 'package:automata/services/interfaces/executeUnitTestService.dart';
import 'package:test/test.dart';

void main() {
  DFA dfa = DFA();
  dfa.states = ["q0", "q1", "q2"];
  dfa.finalStates = ["q2"];
  dfa.initialState = "q0";
  dfa.transactions = ["a", "b", "c"];
  dfa.tableTransactions = {
    "q0": {"a": "q1"},
    "q1": {"b": "q2"},
    "q2": {"c": "q1"},
  };

  test('Executar teste onde o resultado encontrado e o alvo são passed', () {
    UnitTest u = UnitTest("ab", false, ResultTest.passed);
    ExecuteUnitTestService obj = ExecuteUnitTestService(dfa, [u]);

    Map<UnitTest, ResultTest> res = obj.run();
    expect((res[u] == u.target), true);
  });

  test('Executar teste onde o resultado encontrado e o alvo são diferentes 1',
      () {
    UnitTest u = UnitTest("ab", false, ResultTest.failure);
    ExecuteUnitTestService obj = ExecuteUnitTestService(dfa, [u]);

    Map<UnitTest, ResultTest> res = obj.run();
    expect(res[u], ResultTest.passed);
  });

  test('Executar teste onde o resultado encontrado e o alvo são diferentes 2',
      () {
    UnitTest u = UnitTest("abc", false, ResultTest.passed);
    ExecuteUnitTestService obj = ExecuteUnitTestService(dfa, [u]);

    Map<UnitTest, ResultTest> res = obj.run();
    expect(res[u], ResultTest.failure);
  });

  test('Executar teste onde o resultado encontrado e o alvo são failure', () {
    UnitTest u = UnitTest("a", false, ResultTest.failure);
    ExecuteUnitTestService obj = ExecuteUnitTestService(dfa, [u]);

    Map<UnitTest, ResultTest> res = obj.run();
    expect((res[u] == u.target), true);
  });

  test('Executar teste onde o resultado encontrado é error', () {
    UnitTest u = UnitTest("ac", false, ResultTest.failure);
    ExecuteUnitTestService obj = ExecuteUnitTestService(dfa, [u]);

    Map<UnitTest, ResultTest> res = obj.run();
    expect(res[u], ResultTest.error);
  });
}
