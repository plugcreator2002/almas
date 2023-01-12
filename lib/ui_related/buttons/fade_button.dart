import 'package:flutter/material.dart';
import 'package:psr_base/index.dart' show HandleNullable, SafeState;

class FadingButton extends StatefulWidget {
  final Widget child;
  final void Function()? onPressEnd;
  final void Function()? onLongPressEnd;

  const FadingButton({
    Key? key,
    required this.child,
    this.onPressEnd,
    this.onLongPressEnd,
  }) : super(key: key);

  @override
  SafeState<FadingButton> createState() => _FadingButtonState();
}

class _FadingButtonState extends SafeState<FadingButton> {
  double pressing = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: pressing,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onLongPressDown: (_) {
          if (widget.onLongPressEnd.isNotNull) {
            setState(() {
              pressing = 0.4;
            });
          }
        },
        onLongPressUp: () {
          if (widget.onLongPressEnd.isNotNull) {
            setState(() => pressing = 1.0);
            (widget.onLongPressEnd ?? () {})();
          }
        },
        onLongPressCancel: () {
          if (widget.onLongPressEnd.isNotNull) {
            setState(() {
              pressing = 1.0;
            });
          }
        },
        onTapDown: (_) {
          if (widget.onPressEnd.isNotNull) {
            setState(() {
              pressing = 0.4;
            });
          }
        },
        onTapUp: (_) {
          if (widget.onPressEnd.isNotNull) {
            setState(() => pressing = 1.0);
            (widget.onPressEnd ?? () {})();
          }
        },
        onTapCancel: () {
          if (widget.onPressEnd.isNotNull) {
            setState(() {
              pressing = 1.0;
            });
          }
        },
        child: widget.child,
      ),
    );
  }
}
