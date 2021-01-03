// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_email_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginEmailController on _LoginEmailController, Store {
  Computed<bool> _$verifyFieldsComputed;

  @override
  bool get verifyFields =>
      (_$verifyFieldsComputed ??= Computed<bool>(() => super.verifyFields,
              name: '_LoginEmailController.verifyFields'))
          .value;

  final _$fieldEmailAtom = Atom(name: '_LoginEmailController.fieldEmail');

  @override
  String get fieldEmail {
    _$fieldEmailAtom.reportRead();
    return super.fieldEmail;
  }

  @override
  set fieldEmail(String value) {
    _$fieldEmailAtom.reportWrite(value, super.fieldEmail, () {
      super.fieldEmail = value;
    });
  }

  final _$errorEmailAtom = Atom(name: '_LoginEmailController.errorEmail');

  @override
  bool get errorEmail {
    _$errorEmailAtom.reportRead();
    return super.errorEmail;
  }

  @override
  set errorEmail(bool value) {
    _$errorEmailAtom.reportWrite(value, super.errorEmail, () {
      super.errorEmail = value;
    });
  }

  final _$_LoginEmailControllerActionController =
      ActionController(name: '_LoginEmailController');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginEmailControllerActionController.startAction(
        name: '_LoginEmailController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginEmailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearEmail(TextEditingController controller) {
    final _$actionInfo = _$_LoginEmailControllerActionController.startAction(
        name: '_LoginEmailController.clearEmail');
    try {
      return super.clearEmail(controller);
    } finally {
      _$_LoginEmailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validEmail() {
    final _$actionInfo = _$_LoginEmailControllerActionController.startAction(
        name: '_LoginEmailController.validEmail');
    try {
      return super.validEmail();
    } finally {
      _$_LoginEmailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_LoginEmailControllerActionController.startAction(
        name: '_LoginEmailController.resetState');
    try {
      return super.resetState();
    } finally {
      _$_LoginEmailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fieldEmail: ${fieldEmail},
errorEmail: ${errorEmail},
verifyFields: ${verifyFields}
    ''';
  }
}
