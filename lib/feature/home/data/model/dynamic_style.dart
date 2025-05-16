import 'package:flutter/material.dart';

class DynamicStyle {
  String? name;
  Widget Function(Widget child)? builder;

  DynamicStyle({this.name, this.builder});
}

class DynamicTextStyle {
  String? name;
  Widget Function(Widget child, String text, double valueFontSize)? builder;
  DynamicTextStyle({this.name, this.builder});
}
