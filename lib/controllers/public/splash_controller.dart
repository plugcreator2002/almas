// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/notifications/messaging_controller.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SplashController {
  static Future<void> init(
    BuildContext context, {
    required void Function(String route) callback,
  }) async {
    String route = RouteTags.home;
    if (RepositoriesHandler.authToken != null) {
      ServerInterface.instance.setHeaders();
      RepositoriesHandler.getFont();
      RepositoriesHandler.getTheme();

      await context.read<AccountPresenter>().getProfile(
        callback: (model) async {
          RepositoriesHandler.initConfig(model: model);
          MessagingController.openRoom(model?.id);
          // MessagingController.getCount(context);
        },
      );
      callback(route);
    } else {
      callback(route);
    }
  }
}
