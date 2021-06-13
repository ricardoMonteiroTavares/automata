// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stateWidgetController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StateWidgetController on _StateWidgetController, Store {
  final _$_hoverAtom = Atom(name: '_StateWidgetController._hover');

  @override
  bool get _hover {
    _$_hoverAtom.reportRead();
    return super._hover;
  }

  @override
  set _hover(bool value) {
    _$_hoverAtom.reportWrite(value, super._hover, () {
      super._hover = value;
    });
  }

  final _$_colorAtom = Atom(name: '_StateWidgetController._color');

  @override
  Color get _color {
    _$_colorAtom.reportRead();
    return super._color;
  }

  @override
  set _color(Color value) {
    _$_colorAtom.reportWrite(value, super._color, () {
      super._color = value;
    });
  }

  final _$_typeAtom = Atom(name: '_StateWidgetController._type');

  @override
  StateType get _type {
    _$_typeAtom.reportRead();
    return super._type;
  }

  @override
  set _type(StateType value) {
    _$_typeAtom.reportWrite(value, super._type, () {
      super._type = value;
    });
  }

  final _$_positionAtom = Atom(name: '_StateWidgetController._position');

  @override
  Offset get _position {
    _$_positionAtom.reportRead();
    return super._position;
  }

  @override
  set _position(Offset value) {
    _$_positionAtom.reportWrite(value, super._position, () {
      super._position = value;
    });
  }

  final _$_hoverStateAtom = Atom(name: '_StateWidgetController._hoverState');

  @override
  HoverStateWidget get _hoverState {
    _$_hoverStateAtom.reportRead();
    return super._hoverState;
  }

  @override
  set _hoverState(HoverStateWidget value) {
    _$_hoverStateAtom.reportWrite(value, super._hoverState, () {
      super._hoverState = value;
    });
  }

  final _$_StateWidgetControllerActionController =
      ActionController(name: '_StateWidgetController');

  @override
  void select() {
    final _$actionInfo = _$_StateWidgetControllerActionController.startAction(
        name: '_StateWidgetController.select');
    try {
      return super.select();
    } finally {
      _$_StateWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselect() {
    final _$actionInfo = _$_StateWidgetControllerActionController.startAction(
        name: '_StateWidgetController.unselect');
    try {
      return super.unselect();
    } finally {
      _$_StateWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void newType(StateType newType) {
    final _$actionInfo = _$_StateWidgetControllerActionController.startAction(
        name: '_StateWidgetController.newType');
    try {
      return super.newType(newType);
    } finally {
      _$_StateWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEnter(PointerEnterEvent details) {
    final _$actionInfo = _$_StateWidgetControllerActionController.startAction(
        name: '_StateWidgetController.onEnter');
    try {
      return super.onEnter(details);
    } finally {
      _$_StateWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onExit(PointerExitEvent details) {
    final _$actionInfo = _$_StateWidgetControllerActionController.startAction(
        name: '_StateWidgetController.onExit');
    try {
      return super.onExit(details);
    } finally {
      _$_StateWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reposition(DraggableDetails details) {
    final _$actionInfo = _$_StateWidgetControllerActionController.startAction(
        name: '_StateWidgetController.reposition');
    try {
      return super.reposition(details);
    } finally {
      _$_StateWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
