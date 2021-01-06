import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/home/home_controller.dart';
import 'package:ifood_fake_app/views/home/components/markets_view.dart';
import 'package:ifood_fake_app/views/home/components/restaurants_view.dart';
import 'package:ifood_fake_app/views/home/components/widget_text_selected.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: _height * 0.02, left: _width * 0.04),
              child: Row(
                children: [
                 GestureDetector(
                   child: Observer(
                     builder: (_){
                       return  WidgetTextSelected(text: "Restaurantes", selected: HomeSingletonController.selectedView == 0 ? true : false,);
                     },
                   ),
                   onTap: (){
                      HomeSingletonController.nextView(0);
                   },
                 ),
                  SizedBox(width: _width * 0.04,),
                  GestureDetector(
                    child: Observer(
                      builder: (_){
                        return WidgetTextSelected(text: "Mercados",  selected: HomeSingletonController.selectedView == 1 ? true : false,);
                      },
                    ),
                    onTap: (){
                      HomeSingletonController.nextView(1);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Observer(
              builder: (_) => HomeSingletonController.selectedView == 0 ?
              Container(
                  height: _height,
                  width: _width,
                  child: RestaurantsView(),
              ): MarketsView(),
            )
          ],
        ),
      ),
    );
  }
}
