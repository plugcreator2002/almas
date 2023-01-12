import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/edit_profile/views/mobile/edit_profile_mobile.dart';
import 'package:flutter/material.dart';

class MainEditProfile extends StatelessWidget {
  const MainEditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: EditProfileMobile(),
      ),
    );
  }
}
