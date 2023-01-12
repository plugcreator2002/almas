import 'package:almas/controllers/public/notifications/notification_service.dart';
import 'package:almas/data-server/socket_io/base_socket.dart';
import 'package:almas/data-server/socket_io/const.dart';
import 'package:almas/data-server/socket_io/models/socket_response.dart';
import 'package:almas/models/public/notification_parameters.dart';
import 'package:almas/repositories/repositories_handler.dart';

class MessagingController {
  static void closeRoom(num? userID) {
    if (userID != null) {
      SocketIOServices.instance.leaveRoom(userID);
    }
  }

  static void openRoom(num? userID) {
    if (userID != null) {
      SocketIOServices.instance.connect(userID);
    }
  }

  static void send({
    required String event,
    required MessageParameters parameters,
  }) {
    if (parameters.roomID != RepositoriesHandler.userData?.id) {
      SocketIOServices.instance.send(
        event,
        data: parameters.toJson(),
      );
    }
  }

  static void handler(SocketResponse response) {
    NotificationService.show(response);
    SocketIOServices.instance.send(
      SubEventsSocket.messagesCount,
      data: {"roomId": RepositoriesHandler.getUserData?.id},
    );
  }
}
