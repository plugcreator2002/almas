import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RotationBuilder extends StatefulWidget {
  final Widget child;

  const RotationBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<RotationBuilder> createState() => _S();
}

class _S extends State<RotationBuilder> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    animationController.dispose();

    super.dispose();
  }

  void setAngleRotation(double angle) {
    final result = angle * pi / 180;
    animation = Tween<double>(begin: 0, end: result).animate(
      animationController,
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    setAngleRotation(0);
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setAngleRotation(360);
      animationController.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
    );
  }
}
