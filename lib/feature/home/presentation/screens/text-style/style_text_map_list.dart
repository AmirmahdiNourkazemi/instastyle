import 'package:flutter/material.dart';
import 'package:instastyle/feature/home/data/model/dynamic_style.dart';

import 'gradient_style.dart';

List<DynamicTextStyle> get dynamicTextStyle => [
      DynamicTextStyle(
          name: 'گرادیانت',
          builder: (child, text, valueFontSize) => GradientStyle(
                text: text,
                valueFontSize: valueFontSize,
                key: ValueKey(valueFontSize),
                child: child,
              )),
    ];
