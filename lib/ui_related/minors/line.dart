import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double? margin;

  const Line({
    Key? key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final marginSymmetric = EdgeInsets.symmetric(
      vertical: margin ?? 0,
    );

    return Container(
      height: 1.5,
      margin: margin != null ? marginSymmetric : null,
      decoration: BoxDecoration(
        color: SystemHandler.theme.border,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class LineVertical extends StatelessWidget {
  final double? margin;
  final double? height;
  final Color? color;

  const LineVertical({
    Key? key,
    this.margin,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final marginSymmetric = EdgeInsets.symmetric(
      horizontal: margin ?? 0,
    );

    return Container(
      width: 1.5,
      height: height,
      margin: margin != null ? marginSymmetric : null,
      decoration: BoxDecoration(
        color: color ?? SystemHandler.theme.border,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
