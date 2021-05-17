import 'package:automata/enums/target.dart';

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
