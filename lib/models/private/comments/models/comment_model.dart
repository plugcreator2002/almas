import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/private/user_model.dart';

class CommentModel {
  CommentModel({
    this.id = -1,
    this.postId,
    this.content,
    this.replyOf,
    this.createdAt,
    this.updatedAt,
    this.account,
    this.post,
  });

  CommentModel.fromJson(dynamic json) {
    id = json['id'];
    postId = json['post_id'];
    content = json['content'];
    replyOf = json['reply_of'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['account'] != null) {
      account = UserModel.fromJson(json['account']);
    }
    if (json['post'] != null) {
      post = PostModel.fromJson(json['post']);
    }
    if (json['pinned'] != null) {
      final pinned = json['pinned'];
      if (pinned is num) {
        this.pinned = pinned;
      } else if (pinned is bool) {
        if (pinned == true) {
          this.pinned = 1;
        } else if (pinned == false) {
          this.pinned = 0;
        }
      }
    }
  }

  bool get isPinned {
    if (pinned == 1) {
      return true;
    }
    return false;
  }

  num id = -1;
  num? postId;
  String? content;
  num? replyOf;
  num? pinned;
  String? createdAt;
  String? updatedAt;
  UserModel? account;
  PostModel? post;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['post_id'] = postId;
    map['content'] = content;
    map['reply_of'] = replyOf;
    map['pinned'] = pinned;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (account != null) {
      map['account'] = account?.toJson();
    }
    if (post != null) {
      map['post'] = post?.toJson();
    }
    return map;
  }
}
