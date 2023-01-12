import 'package:almas/data-server/socket_io/models/enums.dart';
import 'package:almas/utils/extensions/enum_extension.dart';

/// response for received data
class SocketResponse {
  final String event;
  final String? message;
  final String? status;
  final dynamic data;
  final num? postId;
  final num? userId;
  final MessagingType? type;

  SocketResponse({
    required this.event,
    this.message,
    this.status,
    this.data,
    this.postId,
    this.userId,
    this.type,
  });

  factory SocketResponse.fromJson(String event, dynamic json) {
    MessagingType? getType(String? type) {
      if (type == null) return null;
      switch (type) {
        case "like":
          return MessagingType.like;
        case "comment":
          return MessagingType.comment;
        case "replay":
          return MessagingType.replay;
        case "follow":
          return MessagingType.follow;
        default:
          return null;
      }
    }

    return SocketResponse(
      event: event,
      message: json['message'],
      status: json['status'],
      data: json['data'],
      postId: json['postId'],
      userId: json['userId'],
      type: getType(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message;
    }
    if (status != null) {
      map['status'] = status;
    }
    if (data != null) {
      map['data'] = data;
    }
    if (postId != null) {
      map['postId'] = postId;
    }
    if (userId != null) {
      map['userId'] = userId;
    }
    if (type != null) {
      map['type'] = type?.nameEnum;
    }
    return map;
  }
}
