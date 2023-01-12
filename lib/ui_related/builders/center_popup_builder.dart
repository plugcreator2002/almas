import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class CenterPopupBuilder extends StatelessWidget {
  final Widget child;

  const CenterPopupBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  build(context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: Container(
              width: width / 1.5,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: SystemHandler.theme.system,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 0.5,
                  color: SystemHandler.theme.shadow,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
