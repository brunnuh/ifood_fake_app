import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'login_email_controller.g.dart';

class LoginEmailController = _LoginEmailController with _$LoginEmailController;

abstract class _LoginEmailController with Store {
  // email

  // Observers

  @observable
  String fieldEmail = "";

  @observable
  bool errorEmail = false;

  // code

  @observable
  String code = "";
  // Action

  @action
  void setEmail(String value) => fieldEmail = value;

  @action
  void clearEmail(TextEditingController controller) {
    fieldEmail = "";
    controller.clear();
  }

  @action
  void validEmail(){

    if(!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(fieldEmail)){
      errorEmail = false;
    }
  }
  //end email
  // code

  @action
  void setCode(value) => code = value;

  @action
  void clearCode(TextEditingController controller){
    code = "";
    controller.clear();
  }
// all

  @action
  void resetState() {
    fieldEmail = "";
    errorEmail = false;
  }

// end all
  //Computed
  @computed
  bool get verifyFields => !RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(fieldEmail);
}

LoginEmailController _singleton = LoginEmailController();
LoginEmailController get LoginEmailSingletonController => _singleton;