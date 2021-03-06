import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_fake_app/routes/routes.dart';
import 'package:ifood_fake_app/theme/app_theme.dart';
import 'package:ifood_fake_app/views/restaurant/restaurant_view.dart';


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
      home: RestaurantView(),
      /*onGenerateRoute: (settings){

        return routes(settings);
      },
      initialRoute: 'bottombarview',*/
    );
  }
}
