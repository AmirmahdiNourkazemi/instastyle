import 'package:flutter/material.dart';
import 'package:instastyle/feature/home/data/model/dynamic_style.dart';
import 'package:instastyle/feature/home/presentation/screens/text-style/fade_style.dart';
import 'package:instastyle/feature/home/presentation/screens/text-style/solid_line_border_style.dart';

import 'shadow_line_style.dart';
import 'solid_line_style.dart';

List<DynamicTextStyle> get dynamicTextStyle => [
      DynamicTextStyle(
          name: 'fade line',
          imagePath: 'assets/images/style_fadeLine.png',
          builder: (child, text, textStyle) => FadeLineText(
                text: text,
                textStyle: textStyle,
                child: child,
              )),
      DynamicTextStyle(
          name: 'solid line',
          imagePath: 'assets/images/style_simple.png',
          builder: (child, text, textStyle) => SolidLine(
                text: text,
                textStyle: textStyle,
                child: child,
              )),
      DynamicTextStyle(
          name: 'shadow line',
          imagePath: 'assets/images/style_shadowLine.png',
          builder: (child, text, textStyle) => ShadowLine(
                text: text,
                textStyle: textStyle,
                child: child,
              )),
      DynamicTextStyle(
          name: 'solid line border',
          imagePath: 'assets/images/style_alphaBox.png',
          builder: (child, text, textStyle) => SolidLineBorder(
                text: text,
                textStyle: textStyle,
                child: child,
              )),
    ];
