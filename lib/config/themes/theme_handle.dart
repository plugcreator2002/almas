import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart' show Color;

class ThemeHandle {
  static Color separateColor(
    List<Type> types,
    Color color, [
    Color? defaultColor,
  ]) {
    if (types.contains(SystemHandler.theme.runtimeType)) {
      return color;
    }
    return defaultColor ?? SystemHandler.theme.info;
  }
}
