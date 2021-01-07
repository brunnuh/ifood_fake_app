import 'package:ifood_fake_app/models/restaurant.dart';
import 'package:ifood_fake_app/repositories/Api/api.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{

 Api _api = Api();

 // Observers
 @observable
  int selectedView = 0; // 0 - restaurants , 1 - merkats

 ObservableList<Restaurant> restaurants = ObservableList<Restaurant>();

 // Action
 @action
 Future<void> nextView(int value) async {
    selectedView = value;
    if(value == 0){
      await _api.getRestaurant().then((List<Restaurant> value){
        restaurants.clear();
        value.forEach((element) {
          restaurants.add(element);
        });
      });
    }
  }

 
 //Computed
 @computed
  bool get stts  => selectedView == 0;

}

HomeController _singleton = HomeController();
HomeController get HomeSingletonController => _singleton;