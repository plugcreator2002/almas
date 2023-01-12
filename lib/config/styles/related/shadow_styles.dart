import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart' show BoxShadow;

class ShadowStyles {
  List<BoxShadow> get mainShadow {
    return [
      BoxShadow(
        spreadRadius: 1.1,
        blurRadius: 1,
        color: SystemHandler.theme.shadow,
      ),
    ];
  }
}
