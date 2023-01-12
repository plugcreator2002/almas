import 'package:almas/controllers/public/splash_controller.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/splash/views/mobile/splash_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainSplash extends StatefulWidget {
  const MainSplash({
    Key? key,
  }) : super(key: key);

  @override
  SafeState<MainSplash> createState() => _MainSplashState();
}

class _MainSplashState extends SafeState<MainSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      SplashController.init(context, callback: (route) {
        if (mounted) {
          Navigator.pushReplacementNamed(
            context,
            route,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const BaseWidgets(
        mobile: SplashMobile(),
      ),
    );
  }
}
