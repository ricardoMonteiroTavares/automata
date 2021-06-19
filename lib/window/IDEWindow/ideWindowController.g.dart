// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideWindowController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IDEWindowController on _IDEWindowController, Store {
  Computed<List<LayoutId>>? _$objectsComputed;

  @override
  List<LayoutId> get objects =>
      (_$objectsComputed ??= Computed<List<LayoutId>>(() => super.objects,
              name: '_IDEWindowController.objects'))
          .value;
  Computed<IDELayoutDelegate>? _$positionsComputed;

  @override
  IDELayoutDelegate get positions => (_$positionsComputed ??=
          Computed<IDELayoutDelegate>(() => super.positions,
              name: '_IDEWindowController.positions'))
      .value;

  final _$_managerAtom = Atom(name: '_IDEWindowController._manager');

  @override
  GraphicAutomataManager get _manager {
    _$_managerAtom.reportRead();
    return super._manager;
  }

  @override
  set _manager(GraphicAutomataManager value) {
    _$_managerAtom.reportWrite(value, super._manager, () {
      super._manager = value;
    });
  }

  final _$onFinishAsyncAction = AsyncAction('_IDEWindowController.onFinish');

  @override
  Future onFinish(DragEndDetails details, BuildContext context) {
    return _$onFinishAsyncAction.run(() => super.onFinish(details, context));
  }

  final _$_IDEWindowControllerActionController =
      ActionController(name: '_IDEWindowController');

  @override
  void onTap(TapDownDetails details) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController.onTap');
    try {
      return super.onTap(details);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onUpdate(DragUpdateDetails details) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController.onUpdate');
    try {
      return super.onUpdate(details);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _add(Offset position) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._add');
    try {
      return super._add(position);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _select(String id) {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._select');
    try {
      return super._select(id);
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _unselect() {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController._unselect');
    try {
      return super._unselect();
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete() {
    final _$actionInfo = _$_IDEWindowControllerActionController.startAction(
        name: '_IDEWindowController.delete');
    try {
      return super.delete();
    } finally {
      _$_IDEWindowControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
objects: ${objects},
positions: ${positions}
    ''';
  }
}
