import 'dart:ui' show VoidCallback;

import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/data-server/server_interface/requests/auth/auth.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:flutter/material.dart' show GlobalKey;
import 'package:psr_base/index.dart' show FormBuilderState;

class LoginController {
  final formKey = GlobalKey<FormBuilderState>();
  String email = "";
  String password = "";

  bool acceptPrivacyPolicy = false;

  void login(VoidCallback callback) async {
    final isValid = formKey.currentState?.validate();

    if (isValid != true) {
      // FormController.fieldsErrorsControl(formKey);
      return;
    }

    if (!acceptPrivacyPolicy) {
      PopupOpenerBuilder.toast(
        content: "please-accept-the-terms...".tr,
      );
      return;
    }

    final result = await AuthService.login(
      email,
      password,
    );

    if (result != null) {
      RepositoriesHandler.initConfig(token: result);
      callback();
    }
  }
}
