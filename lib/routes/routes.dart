
import 'package:flutter/cupertino.dart';
import 'package:ifood_fake_app/views/bottom_bar/bottom_bar_view.dart';
import 'package:ifood_fake_app/views/category_restaurant/category_restaurant_view.dart';
import 'package:ifood_fake_app/views/home/home_view.dart';
import 'package:ifood_fake_app/views/login/login_types/login_email_view.dart';
import 'package:ifood_fake_app/views/login/login_view.dart';
import 'package:ifood_fake_app/views/login/verify_code/verify_code_view.dart';

CupertinoPageRoute routes(settings){
  final List args = settings.arguments;
  switch(settings.name){
    case 'loginemailview':
      return CupertinoPageRoute(
          builder: (context) => LoginEmailView()
      );
    case 'verifycodeview':
      return CupertinoPageRoute(
          builder: (context) => VerifyCodeView()
      );
   case 'homeview':
      return CupertinoPageRoute(
          builder: (context) => HomeView()
      );
    case 'bottombarview':
      return CupertinoPageRoute(
          builder: (context) => BottomBarView()
      );
    case 'categoryrestaurantview':
      return CupertinoPageRoute(
        builder: (context) => CategoryRestaurantView(category: args[0],)
      );
    default:
      return CupertinoPageRoute(
          builder: (context) => LoginView()
      );
  }
}