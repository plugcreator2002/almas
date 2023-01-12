import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/messaging/messaging_model.dart';
import 'package:almas/providers/private/notifications_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/views/notifications/widgets/mobile/notification_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsMobile extends StatelessWidget {
  const NotificationsMobile({Key? key}) : super(key: key);

  @override
  build(context) {
    final presenter = Provider.of<NotificationsPresenter>(context);

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        notification: false,
        options: HeaderOptions(
          title: "notifications".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: ItemsBuilder<MessagingModel>(
          key: presenter.notifications.isEmpty ? UniqueKey() : null,
          items: presenter.notifications,
          loading: LoadingKeys.notifications,
          isEmpty: presenter.notifications.isEmpty,
          onRefresh: (pagination) => presenter.getItems(),
          initialOffset: presenter.firstUnseen * 80,
          itemBuilder: (context, index) {
            final element = presenter.notifications[index];

            return NotificationCardMobile(
              key: UniqueKey(),
              index: index,
              notification: element,
            );
          },
        ),
      ),
    );
  }
}
