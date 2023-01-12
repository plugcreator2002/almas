import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/views/signup/views/mobile/signup_mobile.dart';
import 'package:flutter/material.dart';

class MainSignUp extends StatelessWidget {
  const MainSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: SystemHandler.theme.background,
        appBar: CustomHeaderMobile(
          notification: false,
          options: HeaderOptions(
            title: "sign-up".tr,
            leading: OptionsPressed(
              icon: Icons.arrow_back_rounded,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: const BaseWidgets(
          mobile: SignUpMobile(),
        ),
      ),
    );
  }
}
