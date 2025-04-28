import 'package:flutter/material.dart';

import 'parse_color.dart';

TextStyle? parseTextStyle(Map<String, dynamic>? json) {
  if (json == null) return null;
  return TextStyle(
    fontSize: (json['fontSize'] ?? 14).toDouble(),
    color: parseColor(json['color']),
    fontWeight:
        json['fontWeight'] == 'bold' ? FontWeight.bold : FontWeight.normal,
  );
}
