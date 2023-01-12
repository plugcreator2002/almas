import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class ColumnOption extends StatelessWidget {
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final String? label;
  final double labelSize;
  final Color? labelColor;
  final TextDirection? textDirection;
  final void Function()? onTap;

  const ColumnOption({
    Key? key,
    this.icon,
    this.iconSize = 22,
    this.iconColor,
    this.label,
    this.labelSize = 14,
    this.labelColor,
    this.textDirection,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        textDirection: textDirection,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (label != null) ...[
            Text(
              label ?? '',
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: labelSize,
                color: labelColor ?? SystemHandler.theme.upsideSystem,
              ),
            ),
          ],
          if (icon != null && label != null) ...[
            const SizedBox(height: 5),
          ],
          if (icon != null) ...[
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? SystemHandler.theme.info,
            ),
          ],
        ],
      ),
    );
  }
}
