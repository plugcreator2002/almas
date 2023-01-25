import 'package:almas/controllers/public/notifications/messaging_controller.dart';
import 'package:almas/data-server/socket_io/const.dart';
import 'package:almas/data-server/socket_io/models/socket_response.dart';
import 'package:almas/providers/private/notifications_presenter.dart';
import 'package:almas/providers/public/notifications_badge_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:provider/provider.dart';

class SocketResultHandler {
  /// handle the socket response for change provider data from everywhere
  static Future<void> on(SocketResponse response) async {
    final context = RepositoriesHandler.context;
    if (response.event == PubEventsSocket.notification) {
      MessagingController.handler(response);
    } else if ([
      PubEventsSocket.notificationShow,
    ].contains(response.event)) {
      context.read<NotificationsPresenter>().onReceivedData(response);
    } else if ([
      PubEventsSocket.messagesCount,
      PubEventsSocket.messagesSeen,
    ].contains(response.event)) {
      context.read<NotificationsBadgePresenter>().onReceivedData(response);
    }
  }
}
