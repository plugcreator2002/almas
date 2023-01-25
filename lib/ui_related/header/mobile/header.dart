import 'package:almas/controllers/public/system_controller.dart';
import "package:almas/ui_related/header/header_option.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:psr_base/index.dart' show HandleNullable;

class CustomHeaderMobile extends StatelessWidget with PreferredSizeWidget {
  final bool isPinned;
  final HeaderOptions options;
  final ScrollController? controller;
  final VoidCallback? onTap;
  final PreferredSizeWidget? bottom;
  final double height;
  final bool notification;

  const CustomHeaderMobile({
    final Key? key,
    required this.options,
    this.controller,
    this.isPinned = false,
    this.onTap,
    this.bottom,
    this.height = 60,
    this.notification = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size(double.infinity, height);

  @override
  build(context) {
    return AppBar(
      leading: const SizedBox(),
      automaticallyImplyLeading: true,
      backgroundColor:
          options.backgroundColor ?? SystemHandler.theme.background,
      elevation: 2,
      bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: options.backgroundColor ?? Colors.transparent,
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
          color: options.backgroundColor ?? SystemHandler.theme.background,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            options.leadingWidget(context),
            options.flagWidget(context),
            if (options.customer.isNotNull) ...[
              Expanded(child: options.customerHeader() ?? const SizedBox()),
            ] else ...[
              Expanded(child: options.titleWidget() ?? const SizedBox()),
            ],
            ...options.actionWidgets(context, notification),
          ].whereType<Widget>().toList(),
        ),
      ),
    );
  }
}
