import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingWidget(BuildContext context ,{Color? color}) {
  return LoadingAnimationWidget.staggeredDotsWave(
    color: color ?? Theme.of(context).colorScheme.primary,
    size: 49,
  );
}
