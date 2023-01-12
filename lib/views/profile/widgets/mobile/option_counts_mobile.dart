import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';

class OptionCountsMobile extends StatelessWidget {
  final void Function()? onTap;
  final String? label;
  final num? count;

  const OptionCountsMobile({
    Key? key,
    this.onTap,
    this.label,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadingButton(
      onPressEnd: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (label != null) ...[
            Text(
              label ?? '',
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: SystemHandler.theme.info,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            count?.toString() ?? '0',
            style: TextStyle(
              fontFamily: SystemHandler.family,
              fontSize: 13,
              color: SystemHandler.theme.upsideSystem,
            ),
          ),
        ],
      ),
    );
  }
}
