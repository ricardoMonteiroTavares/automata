/// Objeto ao qual representa uma escolha entre 3 classes.
abstract class Options3<L, M, R> {
  const Options3();

  B fold<B>(B ifLeft(L l), B ifMiddle(M c), B ifRight(R r));
  bool isLeft() => fold((_) => true, (_) => false, (_) => false);
  bool isMiddle() => fold((_) => false, (_) => true, (_) => false);
  bool isRight() => fold((_) => false, (_) => false, (_) => true);

  L? get left => fold((_) => _, (_) => null, (_) => null);
  M? get middle => fold((_) => null, (_) => _, (_) => null);
  R? get right => fold((_) => null, (_) => null, (_) => _);
}

/// Objeto que representa o retorno da opção da esquerda de uma função
class Left<L, M, R> extends Options3<L, M, R> {
  final L _l;
  const Left(this._l);
  L get value => _l;

  @override
  B fold<B>(B ifLeft(L l), B ifMiddle(M c), B ifRight(R r)) => ifLeft(value);
  @override
  int get hashCode => _l.hashCode;

  @override
  bool operator ==(other) => other is Left && other.value == value;
}

/// Objeto que representa o retorno da opção da direita de uma função
class Right<L, M, R> extends Options3<L, M, R> {
  final R _r;
  const Right(this._r);
  R get value => _r;
  @override
  B fold<B>(B ifLeft(L l), B ifMiddle(M c), B ifRight(R r)) => ifRight(value);
  @override
  int get hashCode => _r.hashCode;

  @override
  bool operator ==(other) => other is Right && other.value == value;
}

/// Objeto que representa o retorno da opção do meio de uma função
class Middle<L, M, R> extends Options3<L, M, R> {
  final M _m;

  const Middle(this._m);
  M get value => _m;
  @override
  B fold<B>(B ifLeft(L l), B ifMiddle(M c), B ifRight(R r)) => ifMiddle(value);
  @override
  int get hashCode => _m.hashCode;

  @override
  bool operator ==(other) => other is Middle && other.value == value;
}
