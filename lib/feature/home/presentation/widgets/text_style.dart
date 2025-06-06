import 'package:flutter/material.dart';

class TextStyleConfig {
  final String name;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color color;
  final bool? isPro;

  TextStyleConfig({
    required this.name,
    required this.fontFamily,
    this.isPro = false,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.color = Colors.black,
  });

  // Convert to TextStyle
  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
    );
  }

  // Convert from Map (useful for server responses)
  factory TextStyleConfig.fromMap(Map<String, dynamic> map) {
    return TextStyleConfig(
      name: map['name'] ?? 'Unnamed Style',
      fontFamily: map['fontFamily'] ?? 'digikala',
      fontSize: map['fontSize']?.toDouble() ?? 24,
      fontWeight: _parseFontWeight(map['fontWeight']),
      fontStyle: map['italic'] == true ? FontStyle.italic : FontStyle.normal,
      color: _parseColor(map['color']),
    );
  }

  static FontWeight _parseFontWeight(dynamic weight) {
    if (weight == null) return FontWeight.normal;
    if (weight is int)
      return FontWeight.values.firstWhere((e) => e.value == weight);
    if (weight == 'bold') return FontWeight.bold;
    if (weight == 'w100') return FontWeight.w100;
    // Add other cases as needed
    return FontWeight.normal;
  }

  static Color _parseColor(dynamic color) {
    if (color == null) return Colors.black;
    if (color is String) {
      if (color.startsWith('#')) {
        return Color(int.parse(color.substring(1), radix: 16) + 0xFF000000);
      }
      // You can add named color parsing here
    }
    return Colors.black;
  }
}
