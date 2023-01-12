import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/custom_title.dart';
import 'package:flutter/material.dart';

class HeaderOptionsFlagMobile extends StatelessWidget {
  final String label;
  final String data;

  const HeaderOptionsFlagMobile({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTitle(
          size: 14,
          title: label,
          color: SystemHandler.theme.textDisabled,
        ),
        CustomTitle(
          size: 14,
          title: data,
          color: SystemHandler.theme.upsideSystem,
        ),
      ],
    );
  }
}
