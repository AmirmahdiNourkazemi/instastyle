import 'package:flutter/material.dart';

Widget buildDynamicWidget(Map<String, dynamic> json, Widget? textInput) {
  switch (json['type']) {
    case 'Container':
      Color backgroundColor = json['color'] != null
          ? Color(int.parse(json['color'].replaceAll("#", "0xff")))
          : Colors.transparent;
      double? width = json['width']?.toDouble();
      double? height = json['height']?.toDouble();
      double borderRadius = (json['borderRadius'] ?? 0).toDouble();

      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: json['child'] != null
            ? buildDynamicWidget(json['child'], textInput)
            : null,
      );

    case 'Column':
      List<Widget> children = (json['children'] as List<dynamic>)
          .map<Widget>((childJson) => buildDynamicWidget(childJson, textInput))
          .toList();
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );

    case 'Row':
      List<Widget> children = (json['children'] as List<dynamic>)
          .map<Widget>((childJson) => buildDynamicWidget(childJson, textInput))
          .toList();
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );

    case 'Icon':
      IconData iconData;
      switch (json['icon']) {
        case 'Icons.star':
          iconData = Icons.star;
          break;
        case 'Icons.favorite':
          iconData = Icons.favorite;
          break;
        case 'Icons.share':
          iconData = Icons.share;
          break;
        default:
          iconData = Icons.help;
      }
      Color iconColor = json['color'] != null
          ? Color(int.parse(json['color'].replaceAll("#", "0xff")))
          : Colors.black;
      return Icon(iconData, color: iconColor);

    case 'StyledTextInput':
      return textInput ?? const SizedBox();

    default:
      return const SizedBox();
  }
}
