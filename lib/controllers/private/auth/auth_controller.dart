import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/notifications/messaging_controller.dart';
import 'package:almas/data-server/server_interface/requests/auth/auth.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/repositories/permissions/loggedin_permissions.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/popups/mobile/question_popup_mobile.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:flutter/material.dart';

class AuthController {
  static void logoutQuestion() {
    LoggedInPermissions.checkHasToken(() async {
      PopupOpenerBuilder.centerPopup(
        RepositoriesHandler.context,
        child: QuestionPopupMobile(
          question: "do-you-want-to-log-out-of-your-account?".tr,
        ),
      ).then((output) async {
        if (output == true) {
          logout();
        }
      });
    });
  }

  static void logout() {
    LoggedInPermissions.checkHasToken(() async {
      final result = await AuthService.logout();

      if (result) {
        RepositoriesHandler.clearConfig((isCleared, user) {
          if (isCleared) {
            MessagingController.closeRoom(user?.id);
            ServerInterface.instance.clearCookies();
            Navigator.pushReplacementNamed(
              RepositoriesHandler.context,
              RouteTags.splash,
            );
          }
        });
      }
    });
  }

  static Future<bool> refreshToken() async {
    final result = await AuthService.refreshToken();

    if (result != null) {
      await RepositoriesHandler.saveToken(result);
      ServerInterface.instance.setHeaders();
      return true;
    } else {
      logout();
      throw Exception("Failed to refresh token");
    }
  }
}
