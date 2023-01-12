import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart' show TextStyle;

class TextStyles {
  TextStyle get postContent {
    return TextStyle(
      fontFamily: SystemHandler.family,
      fontSize: 14,
      color: SystemHandler.theme.upsideSystem,
    );
  }
}
