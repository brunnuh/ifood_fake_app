import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_fake_app/theme/app_theme.dart';
import 'package:ifood_fake_app/views/login/login_types/login_email_view.dart';
import 'package:ifood_fake_app/views/login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ifood fake ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().defaultTheme(),
      onGenerateRoute: (settings){
        final args = settings.arguments;
        switch(settings.name){
          case 'loginemailview':
            return CupertinoPageRoute(
              builder: (context) => LoginEmailView()
            );
          default:
            return CupertinoPageRoute(
              builder: (context) => LoginView()
            );
        }
      },
      initialRoute: 'login',
    );
  }
}
