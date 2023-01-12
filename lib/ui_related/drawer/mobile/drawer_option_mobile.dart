import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';

class DrawerOptionMobile extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onPressed;

  const DrawerOptionMobile({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 25,
        top: 10,
        bottom: 20,
      ),
      child: FadingButton(
        onPressEnd: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: SystemHandler.theme.textDisabled,
            ),
            const SizedBox(width: 18),
            Text(
              label,
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: 15,
                color: SystemHandler.theme.upsideSystem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
