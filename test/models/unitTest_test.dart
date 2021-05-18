import 'package:automata/enums/resultTest.dart';
import 'package:automata/models/unitTest.dart';
import 'package:test/test.dart';

void main() {
  UnitTest obj = UnitTest();
  test('Criar o objeto UnitTest', () {
    expect(obj, isA<UnitTest>());
  });

  test('Modificar o valor do input', () {
    obj.input = "abcdef";
    expect(obj.input, "abcdef");
  });

  test('Modificar o valor do debug', () {
    obj.debug = true;
    expect(obj.debug, true);
  });

  test('Modificar o valor do target', () {
    obj.target = ResultTest.failure;
    expect(obj.target, ResultTest.failure);
  });
}
