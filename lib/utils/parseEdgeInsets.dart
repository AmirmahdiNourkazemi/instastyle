import 'package:flutter/material.dart';

EdgeInsets parseEdgeInsets(Map<String, dynamic>? json) {
  if (json == null) return EdgeInsets.zero;
  return EdgeInsets.fromLTRB(
    (json['left'] ?? 0).toDouble(),
    (json['top'] ?? 0).toDouble(),
    (json['right'] ?? 0).toDouble(),
    (json['bottom'] ?? 0).toDouble(),
  );
}
