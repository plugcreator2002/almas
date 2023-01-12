import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class RefreshPage extends StatelessWidget {
  final Widget child;
  final void Function()? onRefresh;

  const RefreshPage({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: SystemHandler.theme.info,
      onRefresh: () async {
        if (onRefresh != null) {
          (onRefresh ?? () {})();
          return Future<void>.delayed(
            const Duration(seconds: 1),
          );
        }
        return Future.value();
      },
      child: child,
    );
  }
}
