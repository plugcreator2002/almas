import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';

class PrivatePageLoadingBuilder extends StatelessWidget {
  final Widget child;
  final bool loading;

  const PrivatePageLoadingBuilder({
    Key? key,
    required this.child,
    this.loading = true,
  }) : super(key: key);

  @override
  build(context) {
    if (loading) {
      return Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            color: SystemHandler.theme.primary,
            strokeWidth: 2,
          ),
        ),
      );
    }
    return child;
  }
}
