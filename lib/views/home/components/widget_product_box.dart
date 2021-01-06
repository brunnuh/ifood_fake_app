import 'package:flutter/material.dart';


class WidgetProductBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/img_5.jpg"),
          radius: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Freddo - São Luis", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              ),
              Container(
                child: Text("4.3 - Brasileira - 1,3 km"),
              ),
              Container(
                child: Text("30 - 40 min - R\$4,50"),
              )
            ],
          ),
        )
      ],
    );
  }
}
