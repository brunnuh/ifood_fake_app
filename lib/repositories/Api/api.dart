import 'package:dio/dio.dart';
import 'package:ifood_fake_app/controllers/mobx/login/loginEmail/login_email_controller.dart';
import 'package:ifood_fake_app/models/restaurant.dart';
import 'package:ifood_fake_app/models/user.dart';
import 'package:ifood_fake_app/repositories/contracts/dates.dart';

class Api extends Dates {
  Dio _dio = Dio();


  /*
  * Login
 */
  Future<bool> verifyCode(User user) async {
    try {
      Response response = await _dio.post(
          url + "/verifycode", data: user.toJson());
      if (response.statusCode == 200 && response.data["status"] == "ok") {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future loginWithCode() async {
    try {
      Response response = await _dio.post(url + "/loginwithcode", data: {
        "email": LoginEmailSingletonController.fieldEmail,
        "code": LoginEmailSingletonController.code
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }


  /*
  * Restaurant
 */

  Future<List<Restaurant>> getRestaurant() async {
      List<Restaurant> restaurants = [];
      try {
        Response response = await _dio.get(url + "/restaurants");
        if(response.statusCode == 200){
          response.data["data"]["data"].forEach((element) {
            restaurants.add(Restaurant.fromJson(element));
          });
        }
        return restaurants;
      } on DioError catch (e) {
        print(e.response);
        return restaurants;
      }
    }
}