import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{



 // Observers
 @observable
  int selectedView = 0; // 0 - restaurants , 1 - merkats


 // Action
 @action
  void nextView(int value) => selectedView = value;

 
 //Computed
 @computed
  bool get stts => selectedView == 0;
}

HomeController _singleton = HomeController();
HomeController get HomeSingletonController => _singleton;