// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$sttsComputed;

  @override
  bool get stts => (_$sttsComputed ??=
          Computed<bool>(() => super.stts, name: '_HomeController.stts'))
      .value;

  final _$selectedViewAtom = Atom(name: '_HomeController.selectedView');

  @override
  int get selectedView {
    _$selectedViewAtom.reportRead();
    return super.selectedView;
  }

  @override
  set selectedView(int value) {
    _$selectedViewAtom.reportWrite(value, super.selectedView, () {
      super.selectedView = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void nextView(int value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.nextView');
    try {
      return super.nextView(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedView: ${selectedView},
stts: ${stts}
    ''';
  }
}
