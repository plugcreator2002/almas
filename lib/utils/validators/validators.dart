import 'package:almas/utils/validators/regular_expression.dart';
import 'package:flutter/material.dart' show BuildContext, FormFieldValidator;

class CustomValidators {
  static FormFieldValidator<String> username(
    BuildContext context, {
    String? error,
  }) {
    return (candidate) {
      if (candidate == null) return "";

      final conditions = [
        RegularExpression.username.hasMatch(candidate),
        RegularExpression.enLetters.hasMatch(candidate)
      ];
      if (conditions[0] && conditions[1]) {
        return null;
      }
      return "";
    };
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
