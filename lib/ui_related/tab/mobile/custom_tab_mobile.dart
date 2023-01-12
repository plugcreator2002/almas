import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/controllers/public/tabs/tab_controller.dart';
import "package:flutter/material.dart";

class CustomTabMobile extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final bool isScrollable;
  final CustomTabController customTabHandler;

  CustomTabMobile({
    final Key? key,
    this.height = 60,
    required this.customTabHandler,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size(double.infinity, height);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: SystemHandler.theme.textDisabled,
      labelColor: SystemHandler.theme.info,
      indicatorSize: TabBarIndicatorSize.tab,
      controller: customTabHandler.controller,
      isScrollable: isScrollable,
      onTap: customTabHandler.onTap,
      tabs: customTabHandler.tabs,
      indicatorColor: SystemHandler.theme.info,
      labelStyle: TextStyle(
        fontFamily: SystemHandler.family,
        fontSize: 18,
      ),
    );
  }
}
