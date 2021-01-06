import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/bottombar/bottombar_controller.dart';

class IconBottom extends StatelessWidget {
  final GlobalKey<State> _loading = new GlobalKey<State>();
  IconData icon;
  int numberScreen;
  String textScreen;

  IconBottom({this.icon = Icons.clear, this.numberScreen, this.textScreen = "text"});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Container(
                child: Column(
                  children: <Widget>[
                    Observer(
                      builder: (_){
                        return Icon(icon, size: 30, color: BottomBarSingletonController.selected == numberScreen ? Colors.black : Colors.grey,);
                      },
                    ),
                    Container(
                      child:Text(textScreen, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11),),
                    )
                  ],
                )
            ),
            onTap: () async {
              BottomBarSingletonController.switchScreen(numberScreen);
            },
          ),
        ],
      ),
    );
  }
}
