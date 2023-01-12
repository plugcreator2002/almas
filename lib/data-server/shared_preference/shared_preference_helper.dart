import 'dart:convert';
import 'package:psr_base/index.dart' show HandleNullable;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(String key, dynamic value) async {
    if (value == null) return false;
    final result = await instance.setString(key, json.encode(value));
    if (result.isNotNull) {
      return result;
    }
    return false;
  }

  static dynamic readData(final String key) {
    final result = instance.getString(key);
    if (result.isNotNull) {
      return json.decode(result ?? "");
    }
    return null;
  }

  static Future<bool> removeData(final String key) async {
    final result = await instance.remove(key);
    if (result.isNotNull) {
      return result;
    }
    return false;
  }

  static Future<bool> clear() async {
    return await instance.clear();
  }

  static bool? containsKey(String key) {
    return instance.containsKey(key);
  }

  static Set<String> getKeys(key) {
    return instance.getKeys();
  }

  static void reload(key) async {
    instance.reload();
  }
}
