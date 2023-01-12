import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/guides/views/mobile/guides_mobile.dart';
import 'package:flutter/material.dart';

class MainGuides extends StatelessWidget {
  const MainGuides({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: GuidesMobile(),
      ),
    );
  }
}
