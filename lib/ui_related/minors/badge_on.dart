import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class BadgeOn extends StatelessWidget {
  final Widget child;
  final num? badge;
  final Color? color;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final BoxBorder? border;

  const BadgeOn({
    Key? key,
    required this.child,
    this.badge = 0,
    this.color,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.border,
  }) : super(key: key);

  String get _badge {
    final data = badge?.toString() ?? "";
    if (data.isNotEmpty) {
      if (data.length > 2) {
        return "99+";
      }
      return data;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    if (badge == null || badge == 0) {
      return child;
    }
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: color ?? SystemHandler.theme.error,
              border: border,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _badge,
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  color: SystemHandler.theme.system,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
