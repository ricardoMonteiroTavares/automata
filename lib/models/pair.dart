class Pair<T, K> {
  late K right;
  late T left;

  Pair(this.left, this.right);

  @override
  String toString() => "Pair<${left.toString()},${right.toString()}>";
}
