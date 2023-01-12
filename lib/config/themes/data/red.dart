import 'package:almas/config/mine_colors.dart';
import 'package:almas/config/mine_images.dart';
import 'package:almas/config/themes/const.dart';
import 'package:almas/config/themes/theme_config.dart';
import 'package:flutter/material.dart';

class RedTheme extends ThemeConfig {
  @override
  String get name => ThemesConst.red;

  @override
  String get imageGemEmpty => MineImages.gemEmpty;

  @override
  String get imageGem => MineImages.gemGreen;

  @override
  Color get background => MineColors.lightBg;

  @override
  Color get border => MineColors.lightShadow;

  @override
  Color get disabled => MineColors.lightDisabled;

  @override
  Color get error => MineColors.lightError;

  @override
  Color get info => Colors.redAccent;

  @override
  Color get inherit => MineColors.lightInherit;

  @override
  Color get primary => Colors.redAccent;

  @override
  Color get secondary => MineColors.lightSecondary;

  @override
  Color get shadow => MineColors.lightShadow;

  @override
  Color get success => MineColors.lightSuccess;

  @override
  Color get system => MineColors.lightSystem;

  @override
  Color get upsideSystem => MineColors.darkSystem;

  @override
  Color get warning => MineColors.lightWarning;

  @override
  Color get textDisabled => MineColors.lightTextDisabled;
}
