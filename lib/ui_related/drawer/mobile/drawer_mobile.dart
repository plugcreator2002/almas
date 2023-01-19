import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/auth/auth_controller.dart';
import 'package:almas/controllers/public/menu_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/permissions/loggedin_permissions.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/drawer/mobile/drawer_header_mobile.dart';
import 'package:almas/ui_related/drawer/mobile/drawer_option_mobile.dart';
import 'package:almas/ui_related/minors/warning_no_loggedin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: SystemHandler.theme.system,
      child: ListView(
        children: [
          DrawerHeaderMobile(
            name: RepositoriesHandler.getUserData?.username,
            avatarImage: RepositoriesHandler.getUserData?.avatar,
            coverImage: RepositoriesHandler.getUserData?.background,
          ),
          const WarningNoLoggedIn(),
          DrawerOptionMobile(
            label: "my-profile".tr,
            icon: Icons.person_pin_outlined,
            onPressed: () {
              LoggedInPermissions.checkHasToken(() {
                Navigator.pushNamed(context, RouteTags.profile);
              });
            },
          ),
          DrawerOptionMobile(
            label: "setting".tr,
            icon: Icons.settings,
            onPressed: () {
              LoggedInPermissions.checkHasToken(() {
                Navigator.pushNamed(context, RouteTags.settings);
              });
            },
          ),
          DrawerOptionMobile(
            label: "rules".tr,
            icon: Icons.menu_book_outlined,
            onPressed: () {
              LoggedInPermissions.checkHasToken(() {
                Navigator.pushNamed(context, RouteTags.rules);
              });
            },
          ),
          DrawerOptionMobile(
            label: "guide".tr,
            icon: Icons.info_outline_rounded,
            onPressed: () {
              LoggedInPermissions.checkHasToken(() {
                Navigator.pushNamed(context, RouteTags.guides);
              });
            },
          ),
          DrawerOptionMobile(
            label: "top-users".tr,
            icon: Icons.person_add_outlined,
            onPressed: () {
              LoggedInPermissions.checkHasToken(() {
                Navigator.pushNamed(context, RouteTags.topUsers);
              });
            },
          ),
          DrawerOptionMobile(
            label: "telegram-channel".tr,
            icon: FontAwesomeIcons.telegram,
            onPressed: () => MenuController.openTelegram(),
          ),
          DrawerOptionMobile(
            label: "instagram-page".tr,
            icon: FontAwesomeIcons.instagram,
            onPressed: () => MenuController.openInstagram(),
          ),
          DrawerOptionMobile(
            label: "contact-us".tr,
            icon: Icons.email_outlined,
            onPressed: () => MenuController.support(),
          ),
          DrawerOptionMobile(
            label: "television".tr,
            icon: Icons.live_tv_outlined,
          ),
          DrawerOptionMobile(
            label: "calendar".tr,
            icon: Icons.calendar_month_outlined,
          ),
          DrawerOptionMobile(
            label: "challenge".tr,
            icon: Icons.calendar_month_outlined,
          ),
          DrawerOptionMobile(
            label: "sign-out-account".tr,
            icon: Icons.exit_to_app_outlined,
            onPressed: () => AuthController.logoutQuestion(),
          ),
        ],
      ),
    );
  }
}
