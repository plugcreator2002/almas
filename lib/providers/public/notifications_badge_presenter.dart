import 'package:almas/data-server/socket_io/base_socket.dart';
import 'package:almas/data-server/socket_io/const.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:almas/repositories/repositories_handler.dart';

class NotificationsBadgePresenter extends ParentProvider {
  num count = 0;

  void getCount() {
    SocketIOServices.instance.send(
      SubEventsSocket.messagesCount,
      data: {"roomId": RepositoriesHandler.getUserData?.id},
    );
  }

  @override
  Future<void> onReceivedData([data]) async {
    super.onReceivedData(data);
    if (data?.status == null && data?.status != "ok") return;

    if (data?.event == PubEventsSocket.messagesCount) {
      if (data?.data != null && data?.data is num) {
        count = data?.data;
        notifyListeners();
      }
    } else if (data?.event == PubEventsSocket.messagesSeen) {
      if (count > 0) {
        count--;
        notifyListeners();
      }
    }
  }
}
