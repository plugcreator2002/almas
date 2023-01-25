import 'package:almas/config/mine_colors.dart';
import 'package:almas/config/styles/styles.dart';
import 'package:almas/controllers/public/notifications/on_received_message_handle.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/messaging/messaging_model.dart';
import 'package:almas/providers/private/notifications_presenter.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class NotificationCardMobile extends StatefulWidget {
  final int index;
  final MessagingModel notification;

  const NotificationCardMobile({
    Key? key,
    required this.notification,
    required this.index,
  }) : super(key: key);

  @override
  SafeState<NotificationCardMobile> createState() {
    // ignore: no_logic_in_create_state
    return _NotificationCardMobileState(notification);
  }
}

class _NotificationCardMobileState extends SafeState<NotificationCardMobile> {
  late MessagingModel notification;

  _NotificationCardMobileState(this.notification);

  @override
  void initState() {
    super.initState();
    if (notification.observed == 0) {
      context.read<NotificationsPresenter>().seen(
            notification.id,
            notification.accountId,
            widget.index,
          );

      Future.delayed(const Duration(seconds: 8), () {
        setState(() => notification.observed = 1);
      });
    }
  }

  @override
  build(context) {
    return FadingButton(
      onPressEnd: () {
        OnReceivedMessageHandling.instance.onTap(
          type: notification.type,
          postId: notification.itemID,
          userId: notification.itemID,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 10),
        curve: Curves.fastOutSlowIn,
        constraints: const BoxConstraints(minHeight: 69),
        margin: const EdgeInsets.only(bottom: 15),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: StylesConfig.instance.mainShadow,
          color: [
            MineColors.darkPrimary.withOpacity(0.2),
            SystemHandler.theme.system,
          ][notification.observed?.toInt() ?? 1],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachesImages(
              avatarRadius: 30,
              imageID: notification.profile,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                notification.message ?? "",
                maxLines: 2,
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  fontSize: 14,
                  color: SystemHandler.theme.upsideSystem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
