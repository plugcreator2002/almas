import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double size;
  final TextStyle? style;
  final IconData? icon;
  final Color? iconColor;
  final double iconSize;
  final double limitSpace;
  final int flex;
  final VoidCallback? onClick;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomTitle({
    Key? key,
    this.icon,
    required this.title,
    this.color,
    this.size = 15,
    this.iconColor,
    this.iconSize = 10,
    this.style,
    this.limitSpace = 15,
    this.flex = 0,
    this.onClick,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleDefault = TextStyle(
      fontFamily: SystemHandler.family,
      color: color ?? SystemHandler.theme.upsideSystem,
      fontSize: size,
    );

    return FadingButton(
      onPressEnd: onClick,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? SystemHandler.theme.upsideSystem,
            ),
            SizedBox(width: limitSpace),
          ],
          Expanded(
            flex: flex,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: style ?? styleDefault,
            ),
          ),
        ],
      ),
    );
  }
}
