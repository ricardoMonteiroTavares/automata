import 'package:automata/models/transaction.dart';
import 'package:test/test.dart';

void main() {
  test('Criar o objeto de Transação', () {
    final obj = Transaction(from: "q0", to: "q1", parameter: "0");

    expect(obj.from, "q0");
    expect(obj.to, "q1");
    expect(obj.parameter, "0");
  });
}
