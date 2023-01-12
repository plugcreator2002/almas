import 'dart:ui' show Color;

import 'package:almas/config/mine_colors.dart';
import 'package:almas/config/mine_images.dart';
import 'package:almas/config/themes/const.dart';
import 'package:almas/config/themes/theme_config.dart';

class EiffelTowerTheme extends ThemeConfig {
  @override
  String get name => ThemesConst.eiffeltower;

  @override
  String get imageGemEmpty => MineImages.gemEmptyDark;

  @override
  String get imageGem => MineImages.gemRed;

  @override
  Color get background => MineColors.darkBg;

  @override
  Color get border => MineColors.darkShadow;

  @override
  Color get disabled => MineColors.darkDisabled;

  @override
  Color get error => MineColors.darkError;

  @override
  Color get info => MineColors.darkInfo;

  @override
  Color get inherit => MineColors.darkInherit;

  @override
  Color get primary => MineColors.darkPrimary;

  @override
  Color get secondary => MineColors.darkSecondary;

  @override
  Color get shadow => MineColors.darkShadow;

  @override
  Color get success => MineColors.darkSuccess;

  @override
  Color get system => MineColors.darkSystem;

  @override
  Color get upsideSystem => MineColors.lightSystem;

  @override
  Color get warning => MineColors.darkWarning;

  @override
  Color get textDisabled => MineColors.darkTextDisabled;
}
