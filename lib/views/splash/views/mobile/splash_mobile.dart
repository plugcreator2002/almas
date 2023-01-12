import 'package:almas/config/mine_images.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class SplashMobile extends StatelessWidget {
  const SplashMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      body: Center(
        child: Image.asset(
          MineImages.logo,
          width: 125,
          height: 125,
        ),
      ),
    );
  }
}
