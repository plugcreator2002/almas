import 'package:almas/data-server/socket_io/models/enums.dart';
import 'package:almas/utils/extensions/enum_extension.dart';

class MessagingModel {
  MessagingModel({
    this.id,
    this.itemID,
    this.accountId,
    this.message,
    this.type,
    this.observed,
    this.createdAt,
    this.updatedAt,
  });

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

  MessagingModel.fromJson(dynamic json) {
    id = json['id'];
    itemID = json['item_id'];
    accountId = json['account_id'];
    profile = json['profile'];
    message = json['message'];
    type = getType(json['type']);
    observed = json['observed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? itemID;
  num? accountId;
  String? profile;
  String? message;
  MessagingType? type;
  num? observed;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['item_id'] = itemID;
    map['account_id'] = accountId;
    map['profile'] = profile;
    map['message'] = message;
    map['type'] = type.nameEnum;
    map['observed'] = observed;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
