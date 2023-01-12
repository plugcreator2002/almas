import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/edit_password/views/mobile/edit_password_mobile.dart';
import 'package:flutter/material.dart';

class MainEditPassword extends StatelessWidget {
  const MainEditPassword({
    Key? key,
  }) : super(key: key);

  @override
  build(context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: EditPasswordMobile(),
      ),
    );
  }
}
