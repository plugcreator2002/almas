import 'package:almas/data-server/socket_io/base_socket.dart';
import 'package:almas/data-server/socket_io/const.dart';
import 'package:almas/models/private/messaging/messaging_model.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:psr_base/utils/logger.dart';

class NotificationsPresenter extends ParentProvider {
  num count = 0;
  num firstUnseen = 0;
  List<MessagingModel> notifications = [];

  void setItems(dynamic items) {
    if (items != null && items is List) {
      final data = items.map((e) {
        return MessagingModel.fromJson(e);
      }).toList();

      final index = data.indexWhere(
        (element) => element.observed == 1,
      );

      logger("FirstIndex: $index");
      firstUnseen = index;
      notifications = data;
      notifyListeners();
    }
  }

  void getItems() {
    SocketIOServices.instance.send(
      SubEventsSocket.notificationShow,
      data: {"roomId": RepositoriesHandler.getUserData?.id},
    );
  }

  void getCount() {
    SocketIOServices.instance.send(
      SubEventsSocket.messagesCount,
      data: {"roomId": RepositoriesHandler.getUserData?.id},
    );
  }

  void seen(num? id, num? userID, int index) {
    notifications[index].observed = 1;
    if (count > 0) count--;
    SocketIOServices.instance.send(
      SubEventsSocket.notificationSeen,
      data: {"notificationId": id, "roomId": userID},
    );
  }

  @override
  void dispose() {
    super.dispose();
    notifications = [];
  }

  @override
  Future<void> onReceivedData([data]) async {
    super.onReceivedData(data);
    if (data?.status == null && data?.status != "ok") return;

    if (data?.event == PubEventsSocket.notificationShow) {
      setItems(data?.data);
    } else if (data?.event == PubEventsSocket.messagesCount) {
      if (data?.data != null && data?.data is num) {
        count = data?.data;
        notifyListeners();
      }
    } else if (data?.event == PubEventsSocket.messagesSeen) {
      if (count == 0) {
        Future.delayed(const Duration(seconds: 15), () {
          notifyListeners();
        });
      }
    }
  }
}
