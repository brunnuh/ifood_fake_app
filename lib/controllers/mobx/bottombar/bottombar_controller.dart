import 'package:flutter/material.dart';
import 'package:ifood_fake_app/views/home/home_view.dart';
import 'package:ifood_fake_app/views/perfil/perfil_view.dart';
import 'package:ifood_fake_app/views/requests/requests_view.dart';
import 'package:ifood_fake_app/views/search/search_view.dart';
import 'package:mobx/mobx.dart';

part 'bottombar_controller.g.dart';

class BottombarController = _BottombarController with _$BottombarController;

abstract class _BottombarController with Store{
 // Observers
 ObservableList<Widget> viewsBottomBar = [
   HomeView(),
   SearchView(),
   RequestsView(),
   PerfilView()
 ].asObservable();

 @observable
 int selected = 0;

 
 // Action
 @action
  void switchScreen(int selectedNext) => selected = selectedNext;
 
 
 //Computed

}

BottombarController _singleton = BottombarController();
BottombarController get BottomBarSingletonController => _singleton;