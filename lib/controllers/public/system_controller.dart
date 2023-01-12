import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/themes/const.dart';
import 'package:almas/config/themes/data/light.dart';
import 'package:almas/config/themes/theme_config.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/popups/mobile/question_popup_mobile.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart' show GlobalKey, ScaffoldState;
import 'package:flutter/services.dart' show SystemNavigator;

class SystemHandler {
  static String? get family {
    return RepositoriesHandler.font?.name ?? "nazanin";
  }

  static ThemeConfig theme = LightTheme();

  static void setTheme(String name) {
    ThemesConst.toMap.forEach((key, value) {
      if (name == key) {
        theme = value;
        return;
      }
    });
  }

  static Future<bool> exit(GlobalKey<ScaffoldState> scaffold) async {
    bool result = false;
    if (scaffold.currentState?.isDrawerOpen == true) {
      scaffold.currentState?.closeDrawer();
      result = false;
    } else {
      final output = await PopupOpenerBuilder.centerPopup<bool>(
        scaffold.currentContext!,
        child: QuestionPopupMobile(
          question: "do-you-want-to-exit-app?".tr,
        ),
      );
      if (output == true) {
        result = output ?? false;
        SystemNavigator.pop();
      }
    }
    return result;
  }

  static Future<String> get getDeviceID async {
    final device = DeviceInfoPlugin();
    final android = await device.androidInfo;

    return android.id;
  }
}
