// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottombar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottombarController on _BottombarController, Store {
  final _$selectedAtom = Atom(name: '_BottombarController.selected');

  @override
  int get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$_BottombarControllerActionController =
      ActionController(name: '_BottombarController');

  @override
  void switchScreen(int selectedNext) {
    final _$actionInfo = _$_BottombarControllerActionController.startAction(
        name: '_BottombarController.switchScreen');
    try {
      return super.switchScreen(selectedNext);
    } finally {
      _$_BottombarControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected}
    ''';
  }
}
