import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_fake_app/controllers/mobx/category_restaurant/category_restaurant_controller.dart';
import 'package:ifood_fake_app/models/restaurant.dart';
import 'package:ifood_fake_app/views/global/widget_restaurant_box.dart';

class CategoryRestaurantView extends StatefulWidget {
  String category;

  CategoryRestaurantView({this.category});

  @override
  _CategoryRestaurantViewState createState() => _CategoryRestaurantViewState();
}

class _CategoryRestaurantViewState extends State<CategoryRestaurantView> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.category, style: TextStyle(color: Colors.black87),),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        elevation: 0.4,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: Theme.of(context).primaryColor, size: 30,),
            onPressed: (){
              
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20,),

          Observer(
            builder: (_){
              return CRSingletonController.CRlist.length == 0
                  ? Center( heightFactor: 10,child: CircularProgressIndicator(backgroundColor: Colors.red,))
                  : SizedBox(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: CRSingletonController.CRlist.length,
                  itemBuilder: (context, index){
                    Restaurant _restaurant = CRSingletonController.CRlist[index];
                    return Container(
                      margin: EdgeInsets.only(left: _size.width * 0.03, bottom: 20),
                      child: WidgetRestaurantBox(
                        name: _restaurant.name,
                        image: _restaurant.image,
                        statusOperating: _restaurant.statusOperating,
                        category: widget.category,
                        note: _restaurant.note,
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
