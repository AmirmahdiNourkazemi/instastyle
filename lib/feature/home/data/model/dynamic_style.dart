import 'package:flutter/material.dart';

class DynamicStyle {
  String? name;
   Widget Function(Widget child)? builder;

  DynamicStyle({this.name, this.builder});
}
