import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/requests/auth/auth.dart';
import 'package:flutter/material.dart' show GlobalKey, BuildContext, Navigator;
import 'package:psr_base/plugin_emulators/forms_builder/widgets/builders/form_builder.dart';

class SignUpController {
  final formKey = GlobalKey<FormBuilderState>();
  String email = "";
  String username = "";
  String password = "";
  String repeatPassword = "";

  Future<void> signup(BuildContext context) async {
    final isValid = formKey.currentState?.validate();

    if (isValid != true) {
      // FormController.fieldsErrorsControl(formKey);
      return;
    }
    AuthService.signup({
      'email': email,
      'username': username.toLowerCase(),
      'password': password,
      'passwordConfirm': password,
      'macAddress': await SystemHandler.getDeviceID,
    }).then((result) {
      if (result) {
        Navigator.pop(context);
      }
    });
  }
}
