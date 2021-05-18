import 'package:automata/enums/resultTest.dart';

/// Objeto que armazena os dados necessários para realizar a execução de validação
/// da entrada [input] com o autômato
class UnitTest {
  late String _input;
  late bool _debug;
  late ResultTest _target;

  String get input => _input;
  bool get debug => _debug;
  ResultTest get target => _target;

  set input(String input) => {_input = input};
  set debug(bool debug) => {_debug = debug};
  set target(ResultTest target) => {_target = target};
}
