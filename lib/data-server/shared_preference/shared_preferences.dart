import 'dart:convert';

import 'package:almas/data-server/shared_preference/const.dart';
import 'package:almas/data-server/shared_preference/shared_preference_helper.dart';
import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:psr_base/utils/logger.dart';

class SharedPreferencesPublic {
  static final instance = SharedPreferencesHelper.instance;

  factory SharedPreferencesPublic() => SharedPreferencesPublic._internal();

  SharedPreferencesPublic._internal();

  static Future<bool> clear() async {
    final result = await instance.clear();
    logger(result);
    return result;
  }

  static String? get currentLanguage {
    return instance.getString(PreferencesConst.language);
  }

  static Future<bool> changeLanguage(String language) async {
    return await instance.setString(
      PreferencesConst.language,
      language,
    );
  }

  static String? get authToken {
    return instance.getString(PreferencesConst.authToken);
  }

  static Future<bool> saveToken(String token) async {
    return await instance.setString(
      PreferencesConst.authToken,
      token,
    );
  }

  static Future<bool> removeToken() async {
    return await instance.remove(PreferencesConst.authToken);
  }

  static UserModel? get userData {
    final result = instance.getString(PreferencesConst.userData);

    if (result != null) {
      return UserModel.fromJson(json.decode(result));
    }
    return null;
  }

  static Future<bool> saveUserData(UserModel model) async {
    return await instance.setString(
      PreferencesConst.userData,
      json.encode(model.toJson()),
    );
  }

  static Future<bool> removeUserData() async {
    return await instance.remove(PreferencesConst.userData);
  }

  static Future<bool> saveTheme(SettingProductModel model) async {
    return await instance.setString(
      PreferencesConst.theme,
      jsonEncode(model.toJson()),
    );
  }

  static SettingProductModel? get getTheme {
    final encoded = instance.getString(PreferencesConst.theme);
    if (encoded != null) {
      final result = SettingProductModel.fromJson(
        jsonDecode(encoded),
      );
      return result;
    }
    return null;
  }

  static Future<bool> saveFont(SettingProductModel model) async {
    return await instance.setString(
      PreferencesConst.font,
      jsonEncode(model.toJson()),
    );
  }

  static SettingProductModel? get getFont {
    final encoded = instance.getString(PreferencesConst.font);
    if (encoded != null) {
      final result = SettingProductModel.fromJson(
        jsonDecode(encoded),
      );
      return result;
    }
    return null;
  }

  static Future<void> saveCookies(String cookies) async {
    instance.setString(PreferencesConst.cookies, cookies);
  }

  static String? get cookies {
    return instance.getString(PreferencesConst.cookies);
  }

  static Future<void> get removeCookies {
    return instance.remove(PreferencesConst.cookies);
  }
}
