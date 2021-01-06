import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/bottombar/bottombar_controller.dart';
import 'package:ifood_fake_app/views/bottom_bar/components/icon_bottom.dart';


class BottomBarView extends StatefulWidget {
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 166,
              child: Text("Tv. Argelia Primeira, 10",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor,size: 18,)
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.qr_code_scanner_sharp, color: Colors.red,),
          )
        ],
      ),
      body: Observer(
        builder: (_){
          return BottomBarSingletonController.viewsBottomBar[BottomBarSingletonController.selected];
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10, top: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconBottom(icon: Icons.home, textScreen: "Inicio", numberScreen: 0,),
              IconBottom(icon: Icons.search, textScreen: "Busca", numberScreen: 1,),
              IconBottom(icon: Icons.sticky_note_2, textScreen: "Pedidos", numberScreen: 2,),
              IconBottom(icon: Icons.person_outline, textScreen: "Perfil", numberScreen: 3,),
            ],
          ),
        ),
      ),
    );
  }
}
