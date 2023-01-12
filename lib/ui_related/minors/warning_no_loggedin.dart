import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/utils/operations_related/handle_nullable.dart';

class WarningNoLoggedIn extends StatelessWidget {
  const WarningNoLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (RepositoriesHandler.authToken.isNull) {
      return FadingButton(
        onPressEnd: () => Navigator.pushNamed(
          context,
          RouteTags.login,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 28, top: 15, bottom: 15),
          child: Text(
            "not-logged-in-yet?".tr,
            style: TextStyle(
              fontFamily: SystemHandler.family,
              fontSize: 15,
              color: SystemHandler.theme.info,
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
