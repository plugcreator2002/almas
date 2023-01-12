import 'dart:developer';

import 'package:almas/data-server/socket_io/const.dart';
import 'package:almas/data-server/socket_io/models/socket_response.dart';
import 'package:almas/data-server/socket_io/socket_handler.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:psr_base/utils/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;

class SocketIOServices {
  static final SocketIOServices _singleton = SocketIOServices._private();
  static Function(String event, dynamic data)? onMessage;

  static SocketIOServices instance = _singleton;
  static client.Socket? socket;

  SocketIOServices._private();

  void connect(num? roomId) {
    try {
      if (socket?.connected == true) {
        joinRoom(roomId);
        return;
      }
      socket = client.io(
        RepositoriesConfig.socketIOURL,
        client.OptionBuilder().setTransports([
          "websocket",
        ]).build(),
      );
      socket?.on('connect', (_) => joinRoom(roomId));
      // socket?.on('disconnect', (_) => socket?.);
      socket?.onAny(listen);
    } catch (e) {
      logger(e);
    }
  }

  void leaveRoom(num? roomId) {
    if (socket?.connected == true) {
      logger("leave room");
      socket?.emit(SubEventsSocket.disconnectRoom, {
        "roomId": roomId,
      });
    }
  }

  void joinRoom(num? roomId) {
    if (socket?.connected == true) {
      logger("join room");
      socket?.emit(SubEventsSocket.connectMessaging, {
        "roomId": roomId,
      });
      socket?.emit(
        SubEventsSocket.messagesCount,
        {"roomId": RepositoriesHandler.getUserData?.id},
      );
    }
  }

  void listen(String event, dynamic data) {
    logger("Response Socket Event $event: $data");
    if (data != null && data is Map) {
      final result = SocketResponse.fromJson(event, data);
      SocketResultHandler.on(result);
    }
  }

  /// when you want send a data to the socket server
  void send(String event, {dynamic data}) {
    try {
      if (socket?.connected == true) {
        socket?.emit(event, data);
        log("Emitting...");
      }
    } catch (e) {
      logger(e.toString());
    }
  }

  void onError(error) {
    log('Has Error In Socket: $error');
  }

  void onDone() async {
    await Future.delayed(const Duration(seconds: 5));
    log('WebSocket ReCreate');
  }
}
