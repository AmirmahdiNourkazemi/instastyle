import 'dart:ui';

Color? parseColor(String? hexColor) {
  if (hexColor == null) return null;
  hexColor = hexColor.replaceFirst('#', '');
  if (hexColor.length == 6) hexColor = 'FF$hexColor'; // add alpha if missing
  return Color(int.parse(hexColor, radix: 16));
}
