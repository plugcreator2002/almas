import 'package:almas/models/public/enums.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/utils/extensions/enum_extension.dart';
import 'package:almas/utils/extensions/string_extension.dart';

class MessageParameters {
  final num? roomID;
  final num? userId;

  // owner username
  final String? username;

  // owner avatar image
  final String? profile;
  final String? namePost;
  final num? postId;
  final String? message;
  final String? comment;
  final MoneyFacilities? ability;
  final UserRole? upgradeTo;
  final String? notificationId;

  const MessageParameters({
    required this.roomID,
    this.userId,
    this.username,
    this.profile,
    this.namePost,
    this.postId,
    this.message,
    this.comment,
    this.ability,
    this.upgradeTo,
    this.notificationId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["roomId"] = roomID;
    map["username"] = username ?? RepositoriesHandler.userData?.username;
    if (profile != null) {
      map["profile"] = profile ?? RepositoriesHandler.userData?.avatar;
    }
    if (userId != null) {
      map["userId"] = userId;
    }
    if (namePost != null) {
      final result = namePost?.safeSubstring(0, 15);
      map["name_post"] = result;
    }
    if (postId != null) {
      map["postId"] = postId;
    }
    if (message != null) {
      map["message"] = message;
    }
    if (comment != null) {
      final result = comment?.safeSubstring(0, 15);
      map["comment"] = result;
    }
    if (ability != null) {
      map["ability"] = ability?.nameEnum;
    }
    if (upgradeTo != null) {
      map["upgradeTo"] = upgradeTo?.nameEnum;
    }
    if (notificationId != null) {
      map["notificationId"] = notificationId;
    }

    map.removeWhere((key, value) => value == null);
    return map;
  }
}
