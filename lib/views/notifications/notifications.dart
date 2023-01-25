import 'package:almas/providers/private/notifications_presenter.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/notifications/views/mobile/notifications_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainNotifications extends StatefulWidget {
  const MainNotifications({
    Key? key,
  }) : super(key: key);

  @override
  SafeState<MainNotifications> createState() => _MainNotificationsState();
}

class _MainNotificationsState extends SafeState<MainNotifications> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsPresenter>().getItems();
  }

  @override
  build(context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: NotificationsMobile(),
      ),
    );
  }
}
