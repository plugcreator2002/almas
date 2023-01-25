import 'package:almas/utils/validators/regular_expression.dart';
import 'package:flutter/material.dart' show BuildContext, FormFieldValidator;
import 'package:psr_base/plugin_emulators/forms_builder/utils/form_builder_validators.dart';

class CustomValidators {
  static FormFieldValidator<String> username(
    BuildContext context, {
    String? error,
  }) {
    return FormValidators.compose([
      FormValidators.minLength(context, 6),
      FormValidators.maxLength(context, 30),
      (candidate) {
        if (candidate == null) return "";
        if (RegularExpression.username.hasMatch(candidate)) {
          return null;
        }
        return "";
      }
    ]);
  }

  static FormFieldValidator<String> password(
    BuildContext context, {
    String? error,
  }) {
    return (candidate) {
      if (candidate == null || candidate.isEmpty) return "";

      // if (RegularExpression.password.hasMatch(candidate)) {
      //   return null;
      // }
      return null;
    };
  }
}
