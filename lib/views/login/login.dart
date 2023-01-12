import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/views/login/views/mobile/login_mobile.dart';
import 'package:flutter/material.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({
    Key? key,
  }) : super(key: key);

  bool get accessGoHome {
    final user = RepositoriesHandler.getUserData;
    return [
      // user != null && user.isVerified == true,
      RepositoriesHandler.authToken == null && user == null,
    ].contains(true);
  }

  OptionsPressed? leading(BuildContext context) {
    return OptionsPressed(
      icon: Icons.arrow_back_rounded,
      onPressed: () {
        if (accessGoHome) {
          Navigator.pushReplacementNamed(
            context,
            RouteTags.home,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (accessGoHome) {
          Navigator.pushReplacementNamed(
            context,
            RouteTags.home,
          );
        }
        return accessGoHome;
      },
      child: Scaffold(
        backgroundColor: SystemHandler.theme.background,
        appBar: CustomHeaderMobile(
          notification: false,
          options: HeaderOptions(
            title: "login".tr,
            leading: leading(context),
          ),
        ),
        body: const BaseWidgets(
          mobile: LoginMobile(),
        ),
      ),
    );
  }
}
