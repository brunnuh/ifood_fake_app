import 'package:ifood_fake_app/repositories/contracts/dates.dart';

import 'category_restaurant.dart';

class Restaurant{
  String image;
  String name;
  String phone;
  int statusOperating;
  double note;
  CategoryRestaurant categoryRestaurant;

  Restaurant(
      {this.image,
        this.name,
        this.phone,
        this.statusOperating,
        this.note,
        this.categoryRestaurant});

  Restaurant.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    statusOperating = json['status_operating'];
    note = double.parse(json['note'].toString());
    categoryRestaurant = json['category_restaurant'] != null
        ? new CategoryRestaurant.fromJson(json['category_restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['status_operating'] = this.statusOperating;
    data['note'] = this.note;
    if (this.categoryRestaurant != null) {
      data['category_restaurant'] = this.categoryRestaurant.toJson();
    }
    return data;
  }
}