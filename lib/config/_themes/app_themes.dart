import 'package:almas/config/mine_colors.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
  red,
  orange,
  green,
  back1,
  cat,
  coast,
  darkCoast,
  darkPlain,
  eiffelTower,
  flower,
  girlMoon,
  lonelyBoy,
  lonelyGirl,
  magician,
  minions,
  moon,
  music,
  tower,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: MineColors.lightBg,
  ),
};
