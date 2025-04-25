import 'package:flutter/material.dart';

PreferredSizeWidget appBar({
  required String title,
  List<Widget>? actions,
  Widget? leading,
  bool centerTitle = true,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: centerTitle,
    leading: leading,
    actions: actions,
  );
}