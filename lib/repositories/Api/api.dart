import 'package:dio/dio.dart';
import 'package:ifood_fake_app/controllers/mobx/login/loginEmail/login_email_controller.dart';
import 'package:ifood_fake_app/models/user.dart';
import 'package:ifood_fake_app/repositories/contracts/dates.dart';

class Api extends Dates{
  Dio _dio = Dio();

  Future<bool> verifyCode(User user) async {
    try{
      Response response = await _dio.post(url + "/verifycode", data: user.toJson());
      if(response.statusCode == 200 && response.data["status"] == "ok"){
        return true;
      }
      return false;
    }on DioError catch(e){
        return false;
    }
  }

  Future loginWithCode() async {
    try{

      Response response = await _dio.post(url + "/loginwithcode", data: {
        "email" : LoginEmailSingletonController.fieldEmail,
        "code" : LoginEmailSingletonController.code
      });
      print(response.data);
      if(response.statusCode == 200){
        return true;
      }
      return false;
    }on DioError catch(e){
      print(e.response);
      return false;

    }
  }

}