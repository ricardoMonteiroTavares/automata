import 'package:automata/enums/target.dart';

/// Objeto que armazena os dados necessários para realizar a execução de validação
/// da entrada [input] com o autômato
class UnitTest {
  late String _input;
  late bool _debug;
  late Target _target;

  String get input => _input;
  bool get debug => _debug;
  Target get target => _target;

  set input(String input) => {_input = input};
  set debug(bool debug) => {_debug = debug};
  set target(Target target) => {_target = target};
}
