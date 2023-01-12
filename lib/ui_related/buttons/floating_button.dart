import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class FloatingButtonMobile extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onTap;

  const FloatingButtonMobile({
    Key? key,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: key,
      backgroundColor: SystemHandler.theme.info,
      onPressed: onTap,
      child: Icon(
        icon ?? Icons.mode_edit_outline,
        color: SystemHandler.theme.system,
        size: 30,
      ),
    );
  }
}
