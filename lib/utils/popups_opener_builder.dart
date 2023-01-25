import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/builders/center_popup_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupOpenerBuilder {
  static void toast({
    BuildContext? context,
    required String content,
    SnackBarAction? snackBarAction,
    Color? backgroundColor,
    Color? contentColor,
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    ScaffoldMessenger.of(
      context ?? RepositoriesHandler.context,
    ).showSnackBar(SnackBar(
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      action: snackBarAction,
      margin: const EdgeInsets.all(15),
      content: Text(
        content,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12.5,
          color: contentColor ?? Colors.white,
          fontFamily: SystemHandler.family,
        ),
      ),
    ));
  }

  static Future<T?> centerPopup<T>(
    final BuildContext context, {
    required final Widget child,
    final bool useBuilder = true,
    final bool dismissible = true,
  }) {
    final output = showCupertinoDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        if (useBuilder) {
          return CenterPopupBuilder(child: child);
        }
        return child;
      },
    );

    return output;
  }
}
