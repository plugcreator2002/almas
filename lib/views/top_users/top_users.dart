import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/top_users/views/mobile/top_users_mobile.dart';
import 'package:flutter/material.dart';

class MainTopUsers extends StatelessWidget {
  const MainTopUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: TopUsersMobile(),
      ),
    );
  }
}
