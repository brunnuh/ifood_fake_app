import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/restaurant/restaurant_controller.dart';
import 'package:ifood_fake_app/views/restaurant/components/top_view.dart';


class RestaurantView extends StatefulWidget {

  String name = "Restaurante Dos Chef's";
  String category_restaurant = "Brasileira";
  double distance = 1.2;
  double note = 4.0;



  @override
  _RestaurantViewState createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {



  Widget _rendertodo(context, index){
    return TopView(name: widget.name, note: widget.note, category_restaurant: widget.category_restaurant, distance: widget.distance,);
  }

  // var
  RestaurantController _restaurantController = RestaurantController();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() { // atualiza o app bar caso chegue nessas posicoes
      if(_scrollController.position.pixels >= 25 && _restaurantController.visibleText != true){
        _restaurantController.setText();
      }
      if(_scrollController.position.pixels <= 17) {
        _restaurantController.desableText();
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          Observer(
            builder: (_){
              return SliverAppBar(
                backgroundColor: Theme.of(context).accentColor,
                elevation: 0,
                expandedHeight: 80,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: !_restaurantController.visibleText ? Theme.of(context).accentColor : Theme.of(context).primaryColor),
                ),
                title: _restaurantController.visibleText ?
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.name.toUpperCase(), style: TextStyle(color: Colors.black87, fontSize: 15),),
                    Text("Entregar em 90-100 min", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.black),)
                  ],
                ) : null,
                pinned: true,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.orange.shade300,
                  ),
                ),
                actions: [
                  !_restaurantController.visibleText
                      ? IconButton(icon: Icon(Icons.share), onPressed: null)
                      : Container(),
                  _restaurantController.visibleText
                      ? IconButton(icon: Icon(Icons.favorite_border_outlined, color: Colors.red,), onPressed: null) // modificar icone
                      : IconButton(icon: Icon(Icons.favorite_border_rounded, color: Colors.white,), onPressed: null)
                ],
              );
            },
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              _rendertodo,
              childCount: 1
          )),
        ],
      ),
    );
  }
}
