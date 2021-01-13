import 'package:flutter/material.dart';
import 'package:ifood_fake_app/models/restaurant.dart';
import 'package:ifood_fake_app/repositories/Api/api.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{

 Api _api = Api();

 List categoriesRestaurantsItens = [ // [name, color, image, wight, id_category]
   ["Brasileira", Colors.amber.shade300, "assets/brasileira.png", 80.0, 1],
   ["Saudável", Colors.green.shade600, "assets/saudavel.png", 75.0, 2],
   ["Marmita", Colors.red, "assets/marmita.png", 100.0, 3],
   ["Lanche", Colors.red, "assets/hamburguer.png", 80.0, 4],
   ["Doces & Bolos", Colors.pinkAccent, "assets/docesbolos.png", 50.0, 5],
   ["Japonesa", Colors.pinkAccent, "assets/japonesa.png", 100.0, 6],
   ["Pizza", Colors.deepPurpleAccent, "assets/pizza.png", 70.0, 7]
 ];

 // Observers
 @observable
  int selectedView = 0; // 0 - restaurants , 1 - merkats

 ObservableList<Restaurant> restaurants = ObservableList<Restaurant>();


 // Action
 @action
 Future<void> nextView(int value) async {
    selectedView = value;
    if(value == 0){
      await _api.getRestaurant();/*.then((List<Restaurant> value){
        restaurants.clear();
        value.forEach((element) {
          restaurants.add(element);
        });
      });*/
    }
  }

 
 //Computed
 @computed
  bool get stts  => selectedView == 0;

}

HomeController _singleton = HomeController();
HomeController get HomeSingletonController => _singleton;