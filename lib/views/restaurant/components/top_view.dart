import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopView extends StatelessWidget {
  String name;
  String category_restaurant;
  double distance;
  double note;
  var rn = new Random();

  TopView({this.name, this.distance, this.category_restaurant, this.note});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: size.height * 0.02, left: size.height * 0.02, top: 30),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(name, style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                  Container(
                    width: size.width * 0.4,
                    child: Icon(Icons.arrow_forward_ios, size: 14,),
                    alignment: Alignment.topRight,
                  )
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(category_restaurant, style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                  ),),
                  SizedBox(width: 5,),
                  Icon(Icons.circle, size: 4, color: Colors.black),
                  SizedBox(width: 5,),
                  Text(distance.toString().replaceAll(".", ",") + " Km", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                  ),),
                  SizedBox(width: 5,),
                  Icon(Icons.circle, size: 4, color: Colors.black),
                  SizedBox(width: 5,),
                  Text("\$\$\$\$\$", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                  ),),
                  Container(
                    width: size.width * 0.48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 17,),
                        SizedBox(width: 2,),
                        Text(note.toString() + " (${rn.nextInt(100)})", style: TextStyle(
                            fontSize: 15,
                            color: Colors.orange
                        ),)
                      ],
                    ),
                    alignment: Alignment.topRight,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.32,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.grey
                        )
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Text("Entrega"),
                            margin: EdgeInsets.only(left: 10),
                          ),
                          SizedBox(width: size.width * 0.1,),
                          Container(
                            child: Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor,),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Container(
                      width: size.width * 0.55,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: Colors.grey
                          )
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Hoje,"),
                                margin: EdgeInsets.only(left: size.width * 0.03),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("44-55 min", style: TextStyle(
                                      fontWeight: FontWeight.w300
                                    ),),
                                    margin: EdgeInsets.only(left: size.width * 0.03),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.circle, size: 4, color: Colors.black),
                                  SizedBox(width: 5,),
                                  Container(
                                    child: Text("Grátis", style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.green
                                    ),),
                                    //margin: EdgeInsets.only(left: size.width * 0.03),
                                  ),
                                ],
                              )
                            ],
                          ),
                          //SizedBox(width: size.width * 0.1,),
                          Container(
                            width: size.width * 0.23,
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios, size: 15, color: Theme.of(context).primaryColor,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: size.height * 0.05, bottom: size.height ),
                child: Row(
                  children: [
                    Icon(Icons.monetization_on_outlined, color: Colors.grey,),
                    SizedBox(width: size.width * 0.03,),
                    Text("Pedido minimo R\$ 15,00"),
                    Container(
                      width: size.width * 0.45,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.search),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );;
  }
}
