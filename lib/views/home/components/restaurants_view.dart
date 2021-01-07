import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/bottombar/bottombar_controller.dart';
import 'package:ifood_fake_app/controllers/mobx/home/home_controller.dart';
import 'package:ifood_fake_app/views/home/components/widget_restaurant_box.dart';
class RestaurantsView extends StatefulWidget {


  @override
  _RestaurantsViewState createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {


  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 35,
          child: ListView.builder( // modificar para widgets
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: 10),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade400
                  )
                ),
                child: Center(child: Text("filtros")),
              );
            },
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 90,
          child: ListView.builder( // modificar para widgets
            itemCount: 10,

            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: 10),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 150,
          child: ListView.builder( // modificar para widgets
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: 10),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(child: Text("CUPONS", style: TextStyle(color: Colors.white, fontSize: 20),),),
              );
            },
          ),
        ),
        // faltando outros componentes

        SizedBox(height: _height * 0.02,),
        Container(
          width: _width,
          margin: EdgeInsets.only(left: _width * 0.03),
          child: Text("Lojas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
        ),
        SizedBox(height: _height * 0.02,),
        Observer(
          builder: (_){
            return SizedBox(
              //height: 200,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: HomeSingletonController.restaurants.length,
                itemBuilder: (context, index){
                  return Container(
                      margin: EdgeInsets.only(left: _width * 0.03, bottom: 20),
                      child: WidgetRestaurantBox(
                        image: HomeSingletonController.restaurants[index].image,
                        name: HomeSingletonController.restaurants[index].name,
                        note: HomeSingletonController.restaurants[index].note,
                        category: HomeSingletonController.restaurants[index].categoryRestaurant.name,
                        statusOperating: HomeSingletonController.restaurants[index].statusOperating,
                      )
                  );
                },
              ),
            );
          },
        ),
        SizedBox(height: 200,),
      ],
    );
  }
}

