import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/ui_related/drawer/mobile/drawer_mobile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseWidgets(
      mobile: DrawerMobile(),
    );
  }
}
