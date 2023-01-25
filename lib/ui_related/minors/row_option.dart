import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class RowOption extends StatelessWidget {
  final Color? mainColor;
  final String? image;
  final double imageWidth;
  final double imageHeight;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final String? label;
  final double labelSize;
  final Color? labelColor;
  final TextDirection? textDirection;
  final void Function()? onTap;

  const RowOption({
    Key? key,
    this.icon,
    this.iconSize = 20,
    this.iconColor,
    this.label,
    this.labelSize = 13,
    this.labelColor,
    this.textDirection,
    this.onTap,
    this.image,
    this.imageWidth = 20,
    this.imageHeight = 20,
    this.mainColor,
  }) : super(key: key);

  @override
  build(context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        minimumSize: MaterialStateProperty.all(
          const Size(10, 20),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(style: BorderStyle.none),
        ),
        surfaceTintColor: MaterialStateProperty.all(
          SystemHandler.theme.primary,
        ),
      ),
      child: Row(
        textDirection: textDirection,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: iconSize,
              color: mainColor ?? iconColor ?? SystemHandler.theme.info,
            ),
          ] else if (image != null) ...[
            Image.asset(
              image ?? "",
              width: imageWidth,
              height: imageHeight,
            ),
          ],
          if ((icon != null || image != null) && label != null) ...[
            const SizedBox(width: 5),
          ],
          if (label != null) ...[
            Text(
              label ?? '',
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: labelSize,
                color:
                    mainColor ?? labelColor ?? SystemHandler.theme.upsideSystem,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
