import 'package:automata/enums/resultTest.dart';
import 'package:automata/models/dfa.dart';
import 'package:automata/models/unitTest.dart';
import 'package:automata/services/implementations/executeUnitTestServiceImpl.dart';
import 'package:flutter/widgets.dart';

abstract class ExecuteUnitTestService {
  factory ExecuteUnitTestService(DFA dfa, List<UnitTest> tests) =
      ExecuteUnitTestServiceImpl;

  Map<UnitTest, ResultTest> run();

  @protected
  ResultTest runUnitTest(UnitTest u);

  @protected
  String? transaction(String actualState, String parameter);
}
