import 'package:flutter/material.dart';
import 'package:instastyle/feature/home/data/model/dynamic_style.dart';
import 'package:instastyle/feature/home/presentation/screens/text-style/solid_line_border_style.dart';

import 'shadow_line_style.dart';
import 'solid_line_style.dart';

List<DynamicTextStyle> get dynamicTextStyle => [
      DynamicTextStyle(
          name: 'solid line',
          builder: (child, text, valueFontSize) => SolidLine(
                text: text,
                valueFontSize: valueFontSize,
                key: ValueKey(valueFontSize),
                child: child,
              )),
                DynamicTextStyle(
          name: 'shadow line',
          builder: (child, text, valueFontSize) => ShadowLine(
                text: text,
                valueFontSize: valueFontSize,
                key: ValueKey(valueFontSize),
                child: child,
              )),
              DynamicTextStyle(
          name: 'fade line',
          builder: (child, text, valueFontSize) => SolidLineBorder(
                text: text,
                valueFontSize: valueFontSize,
                key: ValueKey(valueFontSize),
                child: child,
              )),
              
    ];
