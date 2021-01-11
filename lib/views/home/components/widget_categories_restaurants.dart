import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCategoriesRestaurants extends StatelessWidget {
  String image;
  String name;
  Color color;
  double width;

  WidgetCategoriesRestaurants({this.image, this.name, this.color = Colors.amber, this.width});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 100,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).accentColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 43),
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              Center(
                child: Image.asset(image, width: width, height: 100,),
              )
            ],
          ),
          Container(
            //margin: EdgeInsets.only(top: 10),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.w300),),
          )
        ],
      ),
    );
  }
}
