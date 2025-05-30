import 'package:flutter/material.dart';

class DynamicStyle {
  String? name;
  String? imagePath;
  Widget Function(Widget child)? builder;

  DynamicStyle({this.name, this.imagePath,this.builder});
}

class DynamicTextStyle {
  String? name;
  String? imagePath;
  Widget Function(Widget child, String text, TextStyle textStyle)? builder;
  DynamicTextStyle({this.name, this.imagePath,this.builder});
}
