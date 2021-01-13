import 'package:ifood_fake_app/models/restaurant.dart';
import 'package:ifood_fake_app/repositories/Api/api.dart';
import 'package:mobx/mobx.dart';

part 'category_restaurant_controller.g.dart';

class CategoryRestaurantController = _CategoryRestaurantController with _$CategoryRestaurantController;

abstract class _CategoryRestaurantController with Store{
 Api _api = Api();

  // Observers
  ObservableList<Restaurant> CRlist = ObservableList<Restaurant>();
 
 
 // Action
 @action
  Future<void> get(int id) async {
    await  _api.getCategoryRestaurant(id);
  }
 
 
 //Computed

}

CategoryRestaurantController _singleton = CategoryRestaurantController();
CategoryRestaurantController get CRSingletonController => _singleton;