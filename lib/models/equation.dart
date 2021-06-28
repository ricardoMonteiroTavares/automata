/// Representa uma equação geral da reta no modo: ax + by + c = 0
class Equation {
  late double _a;
  late double _b;
  late double _c;

  /// Determina os valores da equação através do determinante da seguinte matriz:
  /// ( xa  ya  1 )
  /// ( xb  yb  1 )
  /// ( x   y   1 )
  Equation.create(
      {required double xa,
      required double ya,
      required double xb,
      required double yb}) {
    _a = ya - yb;
    _b = xb - xa;
    _c = (xa * yb) - (xb * ya);
  }

  double y({required double x}) => ((_a * x) + _c) / (-_b);
}
