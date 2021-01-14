// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantController on _RestaurantController, Store {
  final _$visibleTextAtom = Atom(name: '_RestaurantController.visibleText');

  @override
  bool get visibleText {
    _$visibleTextAtom.reportRead();
    return super.visibleText;
  }

  @override
  set visibleText(bool value) {
    _$visibleTextAtom.reportWrite(value, super.visibleText, () {
      super.visibleText = value;
    });
  }

  final _$_RestaurantControllerActionController =
      ActionController(name: '_RestaurantController');

  @override
  void setText() {
    final _$actionInfo = _$_RestaurantControllerActionController.startAction(
        name: '_RestaurantController.setText');
    try {
      return super.setText();
    } finally {
      _$_RestaurantControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void desableText() {
    final _$actionInfo = _$_RestaurantControllerActionController.startAction(
        name: '_RestaurantController.desableText');
    try {
      return super.desableText();
    } finally {
      _$_RestaurantControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visibleText: ${visibleText}
    ''';
  }
}
