import 'package:mobx/mobx.dart';

part 'restaurant_controller.g.dart';

class RestaurantController = _RestaurantController with _$RestaurantController;

abstract class _RestaurantController with Store{
 // Observers
 @observable
  bool visibleText = false;
 
 
 // Action
 @action
  void setText() => visibleText = true;

 @action
 void desableText() => visibleText = false;
 
 //Computed

}
