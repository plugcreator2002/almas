const base = "Notification_";

// events for send data
class SubEventsSocket {
  static const connectMessaging = '${base}start';
  static const disconnectRoom = 'disconnect_room';

  static const comment = '${base}comments';
  static const follow = '${base}follow';
  static const ban = '${base}ban';
  static const likes = '${base}likes';
  static const reply = '${base}replay';
  static const removePost = '${base}remove_post';
  static const removeAvatar = '${base}remove_profile';
  static const updateUserRole = '${base}upgrade_to';
  static const activeUserTick = '${base}tick_red';
  static const activeFacilities = '${base}facilities';

  static const notificationShow = '${base}show';
  static const notificationSeen = '${base}unseen';
  static const messagesCount = '${base}number';
}

// events for received data
class PubEventsSocket {
  static const notification = "Notification";
  static const notificationShow = "show";
  static const messagesCount = "number";
  static const messagesSeen = "unseen";
}
