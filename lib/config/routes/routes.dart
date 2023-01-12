import 'package:flutter/material.dart';

class Routes {
  static Route<T> fadeThrough<T>(
    RouteSettings settings,
    WidgetBuilder page, {
    int duration = 400,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
