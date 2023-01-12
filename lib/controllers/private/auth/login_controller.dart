import 'dart:ui' show VoidCallback;

import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/requests/auth/auth.dart';
import 'package:flutter/material.dart' show GlobalKey;
import 'package:psr_base/plugin_emulators/forms_builder/widgets/builders/form_builder.dart';

class LoginController {
  final formKey = GlobalKey<FormBuilderState>();
  String email = "";
  String password = "";

  void login(VoidCallback callback) async {
    final isValid = formKey.currentState?.validate();

    if (isValid != true) {
      // FormController.fieldsErrorsControl(formKey);
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
