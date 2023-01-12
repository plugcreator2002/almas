import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/home/views/mobile/home_mobile.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseWidgets(
      mobile: HomeMobile(),
    );
  }
}
