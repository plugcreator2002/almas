import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/public/notifications_badge_presenter.dart';
import 'package:almas/repositories/permissions/loggedin_permissions.dart';
import "package:almas/ui_related/buttons/fade_button.dart";
import 'package:almas/ui_related/minors/badge_on.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:psr_base/index.dart' show HandleNullable;

class HeaderOptions {
  final String? title;
  final Color? backgroundColor;
  final OptionsPressed? leading;
  final Widget? flag;
  final List<OptionsPressed>? actions;
  final List<OptionsPressed>? customer;

  const HeaderOptions({
    this.leading,
    this.flag,
    this.title,
    this.actions,
    this.backgroundColor,
    this.customer,
  });

  List<Widget> actionWidgets(
    BuildContext context,
    bool notification,
  ) {
    List<OptionsPressed> actions = this.actions ?? [];
    List<Widget> options = [];

    if (notification) {
      final presenter = Provider.of<NotificationsBadgePresenter>(context);
      actions = [
        OptionsPressed(
          icon: Icons.notifications_none_sharp,
          badge: presenter.count.toInt(),
          onPressed: () {
            LoggedInPermissions.checkHasToken(() {
              Navigator.pushNamed(
                context,
                RouteTags.notifications,
              );
            });
          },
        ),
        ...actions,
      ];
    }

    for (final element in actions) {
      options.add(FadingButton(
        key: UniqueKey(),
        onPressEnd: () {
          LoggedInPermissions.checkHasToken(() {
            (element.onPressed ?? () {})();
          });
        },
        child: BadgeOn(
          badge: element.badge,
          top: -4,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              element.icon,
              color: SystemHandler.theme.textDisabled,
              size: 25,
            ),
          ),
        ),
      ));
    }

    return options;
  }

  Widget? leadingWidget(BuildContext context) {
    return FadingButton(
      onPressEnd: () {
        if (leading?.onPressed?.isNotNull == true) {
          leading?.onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Icon(
          leading?.icon ?? Icons.arrow_back_ios_rounded,
          color: SystemHandler.theme.textDisabled,
          size: 25,
        ),
      ),
    );
  }

  Widget? flagWidget(BuildContext context) {
    return flag;
  }

  Widget? titleWidget() {
    if (title != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 1, right: 10),
        child: Text(
          title ?? "",
          style: TextStyle(
            fontFamily: SystemHandler.family,
            color: SystemHandler.theme.info,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      );
    }
    return null;
  }

  Widget? customerHeader() {
    if (customer != null) {
      final image = customer?[0].image;
      final subtitle = customer?[1].label;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image.isNotNull) ...[
            Image.asset(
              image ?? "",
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                titleWidget(),
                Text(
                  subtitle ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: SystemHandler.family,
                    color: Colors.grey.shade600,
                    fontSize: 11,
                  ),
                ),
              ].whereType<Widget>().toList(),
            ),
          ),
        ],
      );
    }
    return null;
  }
}

class OptionsPressed {
  final String? image;
  final IconData? icon;
  final String? label;
  final VoidCallback? onPressed;
  final int badge;

  const OptionsPressed({
    this.image,
    this.icon,
    this.onPressed,
    this.label,
    this.badge = 0,
  });
}
