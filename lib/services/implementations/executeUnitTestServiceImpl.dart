import 'package:automata/enums/resultTest.dart';
import 'package:automata/models/dfa.dart';
import 'package:automata/models/unitTest.dart';
import 'package:automata/services/interfaces/executeUnitTestService.dart';

class ExecuteUnitTestServiceImpl implements ExecuteUnitTestService {
  late DFA _dfa;
  late List<UnitTest> _tests;

  ExecuteUnitTestServiceImpl(DFA dfa, List<UnitTest> tests) {
    assert(tests.isNotEmpty, "A lista de testes não pode estar vazia");
    assert(dfa.finalStates.isNotEmpty,
        "O AFD precisa ter ao menos 1 estado final");
    assert(dfa.initialState != "", "O AFD deve ter um estado inicial");
    assert(
        dfa.transactions.isNotEmpty, "O AFD precisa ter ao menos 1 transição");
    _dfa = dfa;
    _tests = tests;
  }

  @override
  Map<UnitTest, ResultTest> run() {
    Map<UnitTest, ResultTest> results = {};

    for (UnitTest u in _tests) {
      ResultTest res = runUnitTest(u);

      results.addAll({u: res});
    }
    return results;
  }

  @override
  ResultTest runUnitTest(UnitTest u) {
    final String input = u.input;
    String state = _dfa.initialState;

    for (String p in input.split('')) {
      String? res = transaction(state, p);
      if (res == null) {
        return ResultTest.error;
      } else {
        state = res;
      }
    }

    if (_dfa.finalStates.contains(state)) {
      return ResultTest.passed;
    }
    return ResultTest.failure;
  }

  @override
  String? transaction(String actualState, String parameter) {
    Map<String, String>? map = _dfa.tableTransactions[actualState];

    if (map == null) {
      return null;
    }
    return map[parameter];
  }
}
