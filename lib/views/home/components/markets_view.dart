import 'package:flutter/material.dart';

class MarketsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.deepPurpleAccent,
      height: _height,
      width: _width,
    );
  }
}
