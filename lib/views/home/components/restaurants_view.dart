
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/category_restaurant/category_restaurant_controller.dart';
import 'package:ifood_fake_app/controllers/mobx/home/home_controller.dart';
import 'package:ifood_fake_app/views/global/widget_restaurant_box.dart';
import 'package:ifood_fake_app/views/home/components/widget_categories_restaurants.dart';



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
          height: 150,
          child: ListView.builder( // modificar para widgets
            itemCount: HomeSingletonController.categoriesRestaurantsItens.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              List data = HomeSingletonController.categoriesRestaurantsItens[index];
              return GestureDetector(
                child: WidgetCategoriesRestaurants(name: data[0], color: data[1], image: data[2], width: double.parse(data[3].toString()),),
                onTap: (){
                  CRSingletonController.CRlist.clear();
                  CRSingletonController.get(data[4]);
                  Navigator.pushNamed(context, "categoryrestaurantview", arguments: [data[0]]);
                },
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
