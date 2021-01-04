class User{
  String email;

  User({this.email});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["email"] = this.email;

    return data;
  }
}