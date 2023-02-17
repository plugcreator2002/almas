import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/privacy_policy/views/mobile/privacy_policy_mobile.dart';
import 'package:flutter/material.dart';

class MainPrivacyPolicy extends StatelessWidget {
  const MainPrivacyPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: PrivacyPolicyMobile(),
      ),
    );
  }
}
