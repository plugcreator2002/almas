import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/views/forget_password/views/mobile/forget_password_mobile.dart';
import 'package:flutter/material.dart';

class MainForgetPassword extends StatelessWidget {
  const MainForgetPassword({
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
            title: "recovery-password".tr,
            leading: OptionsPressed(
              icon: Icons.arrow_back_rounded,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: const BaseWidgets(
          mobile: ForgetPasswordMobile(),
        ),
      ),
    );
  }
}
