import 'dart:convert';

import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/mine_colors.dart';
import 'package:almas/controllers/public/notifications/on_received_message_handle.dart';
import 'package:almas/data-server/socket_io/models/socket_response.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> setup() async {
    const initializationSettingsAndroid = AndroidInitializationSettings(
      "notification_icon",
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          final result = SocketResponse.fromJson(
            "",
            jsonDecode(details.payload ?? ""),
          );
          OnReceivedMessageHandling.instance.onTap(
            type: result.type,
            postId: result.postId,
            userId: result.userId,
          );
        }
      },
    );
  }

  static Future<void> show(SocketResponse response) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      "ASAKJKCSUAS",
      "almas-social",
      sound: UriAndroidNotificationSound("notification.mp3"),
      importance: Importance.max,
      priority: Priority.high,
      color: MineColors.blue,
    );
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await notificationsPlugin.show(
      69,
      "gem".tr,
      response.message ?? "",
      platformChannelSpecifics,
      payload: jsonEncode(response.toJson()),
    );
  }
}
