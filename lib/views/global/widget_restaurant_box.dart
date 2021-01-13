import 'package:flutter/material.dart';


class WidgetRestaurantBox extends StatelessWidget {
  String name;
  double note;
  String image;
  String category;
  int statusOperating;
  String distance;
  String textStatus;

  WidgetRestaurantBox({this.name, this.note, this.category, this.image, this.statusOperating}){
     textStatus = statusOperating == 1 ? "30 - 40 min" : "Fechado";
  }



  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: _size.width * 0.15,
          height: _size.height * 0.09,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: statusOperating == 1 ? null : ColorFilter.mode(Colors.white, BlendMode.color)
            )
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(name[0].toUpperCase() + name.substring(1).toLowerCase(), style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: statusOperating == 1 ? Colors.black : Colors.grey
                ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.star, color: statusOperating == 1 ? Colors.orange : Colors.grey, size: 15,),
                    SizedBox(width: _size.width * 0.004,),
                    Container(
                      child: Text(note.toString(), style: TextStyle(
                          color: statusOperating == 1 ? Colors.orange : Colors.grey
                      ),),
                    ),
                    SizedBox(width: _size.width * 0.01,),
                    Icon(Icons.circle, size: 4, color: statusOperating == 1 ? Colors.black : Colors.grey),
                    SizedBox(width: _size.width * 0.01,),
                    Container(
                      child: Text(category, style: TextStyle(
                          color: statusOperating == 1 ? Colors.black : Colors.grey
                      ),),
                    ),
                    SizedBox(width: _size.width * 0.01,),
                    Icon(Icons.circle, size: 4, color: statusOperating == 1 ? Colors.black : Colors.grey),
                    SizedBox(width: _size.width * 0.01,),
                    Container(
                      child: Text("5,4km", style: TextStyle(
                          color: statusOperating == 1 ? Colors.black : Colors.grey
                      ),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _size.height * 0.01,),
              Row(
                children: [
                  Container(
                    child: Text(textStatus, style: TextStyle(
                        fontWeight: FontWeight.w400
                    ),),
                  ),
                  SizedBox(width: _size.width * 0.01,),
                  Icon(Icons.circle, size: 4, color: statusOperating == 1 ? Colors.black : Colors.grey),
                  SizedBox(width: _size.width * 0.01,),
                  Container(
                    child: Text("R\$5,00", style: TextStyle(
                        color: statusOperating == 1 ? Colors.black : Colors.grey
                    ),),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
