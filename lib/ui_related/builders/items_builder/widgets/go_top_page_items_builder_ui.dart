import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class GoTopPageItemsBuilderUi extends StatelessWidget {
  final bool reverse;
  final void Function() onPressed;

  const GoTopPageItemsBuilderUi({
    Key? key,
    required this.onPressed,
    this.reverse = false,
  }) : super(key: key);

  @override
  build(context) {
    return Positioned(
      bottom: 20,
      right: 30,
      child: FloatingActionButton(
        backgroundColor: SystemHandler.theme.secondary,
        onPressed: onPressed,
        child: Icon(
          [
            Icons.arrow_downward_rounded,
            Icons.arrow_upward_rounded
          ][reverse ? 0 : 1],
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
