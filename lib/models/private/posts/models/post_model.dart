import 'package:almas/models/private/user_model.dart';

class PostModel {
  PostModel({
    this.id = -1,
    this.content,
    this.likeCount = 0,
    this.isLiked = false,
    this.commentCount = 0,
    this.createdAt,
    this.updatedAt,
    this.account,
  });

  PostModel.fromJson(json) {
    id = json['id'] ?? -1;
    content = json['content'];
    likeCount = json['like_count'] ?? 0;
    isLiked = json['isLiked'] ?? false;
    commentCount = json['comment_count'] ?? 0;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['account'] != null) {
      account = UserModel.fromJson(json['account']);
    }
  }

  num id = -1;
  String? content;
  num likeCount = 0;
  bool isLiked = false;
  num commentCount = 0;
  String? createdAt;
  String? updatedAt;
  UserModel? account;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['like_count'] = likeCount;
    map['isLiked'] = isLiked;
    map['comment_count'] = commentCount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['account'] = account?.toJson();
    return map;
  }
}
