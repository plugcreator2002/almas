import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/data-server/shared_preference/shared_preferences.dart';
import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psr_base/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoriesHandler {
  static UserModel? userData;
  static SettingProductModel? font;
  static SettingProductModel? theme;
  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context {
    return navigatorKey.currentContext!;
  }

  static void initConfig({String? token, UserModel? model}) {
    if (token != null) {
      saveToken(token);
    }
    if (model != null) {
      saveUserData(model);
    }
  }

  static void clearConfig(
    void Function(bool isCleared, UserModel? model) callback,
  ) async {
    final result = await SharedPreferencesPublic.clear();

    if (result) {
      callback(result, userData);
      userData = null;
      font = null;
      theme = null;
      SystemHandler.setTheme("light");
    }
  }

  static void saveToken(token) {
    SharedPreferencesPublic.saveToken(token);
  }

  static String? get authToken => SharedPreferencesPublic.authToken;

  static void saveTheme(SettingProductModel model) {
    SharedPreferencesPublic.saveTheme(model);
    if (model.name != null) {
      theme = model;
      SystemHandler.setTheme(model.name ?? "");
    }
  }

  static SettingProductModel? getTheme() {
    final model = SharedPreferencesPublic.getTheme;
    theme = model;
    if (model?.name != null) {
      SystemHandler.setTheme(model?.name ?? "");
    }
    return theme;
  }

  static void saveFont(SettingProductModel model) {
    SharedPreferencesPublic.saveFont(model);
    font = model;
  }

  static SettingProductModel? getFont() {
    final model = SharedPreferencesPublic.getFont;
    font = model;
    return font;
  }

  static void saveUserData(UserModel model) {
    userData = model;
    SharedPreferencesPublic.saveUserData(model);
  }

  static UserModel? get getUserData {
    userData = SharedPreferencesPublic.userData;
    return userData;
  }

  static Future<void> launchURL(
    Uri url, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    if (await canLaunchUrl(url)) {
      logger("message");
      await launchUrl(url, mode: mode);
    }
  }

  static void copy(String? text) {
    if (text != null) {
      Clipboard.setData(ClipboardData(text: text));
    }
  }
}
