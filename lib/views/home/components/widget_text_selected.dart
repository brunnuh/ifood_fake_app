import 'package:flutter/material.dart';

class WidgetTextSelected extends StatelessWidget {

  String text;
  bool selected;


  WidgetTextSelected({this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Text(text, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: selected ? Theme.of(context).primaryColor : Colors.grey
            ),)
        ),
        SizedBox(height: 10,),
        selected ? Container(
          color: Theme.of(context).primaryColor,
          height: 1,
          width: text == "Mercados" ? 87 : 110,
        ) : Container()
      ],
    );
  }
}
