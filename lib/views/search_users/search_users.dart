import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/search_users/views/mobile/search_users_mobile.dart';
import 'package:flutter/material.dart';

class MainSearchUsers extends StatelessWidget {
  const MainSearchUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: SearchUsersMobile(),
      ),
    );
  }
}
