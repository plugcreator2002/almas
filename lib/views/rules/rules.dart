import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/rules/views/mobile/rules_mobile.dart';
import 'package:flutter/material.dart';

class MainRules extends StatelessWidget {
  const MainRules({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: RulesMobile(),
      ),
    );
  }
}
