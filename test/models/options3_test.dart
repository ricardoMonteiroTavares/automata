import 'package:automata/models/options3.dart';
import 'package:test/test.dart';

Options3<bool, int, String> generateString() => RightOption("Teste");
Options3<bool, int, String> generateInt() => MiddleOption(-1);
Options3<bool, int, String> generateBool() => LeftOption(false);
void main() {
  test("Verificar se o valor de resposta é da esquerda (bool)", () {
    Options3<bool, int, String> resp = generateBool();

    expect(resp.isLeft(), true);
    expect(resp.left, false);
  });

  test("Verificar se o valor de resposta é da direita (String)", () {
    Options3<bool, int, String> resp = generateString();

    expect(resp.isRight(), true);
    expect(resp.right, "Teste");
  });

  test("Verificar se o valor de resposta é do centro (int)", () {
    Options3<bool, int, String> resp = generateInt();

    expect(resp.isMiddle(), true);
    expect(resp.middle, -1);
  });
}
