import 'package:almas/config/routes/const.dart';
import 'package:almas/data-server/server_interface/requests/account/account.dart';
import 'package:almas/data-server/server_interface/requests/posts/posts.dart';
import 'package:almas/data-server/socket_io/models/enums.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:flutter/material.dart';

class OnReceivedMessageHandling {
  static OnReceivedMessageHandling instance = OnReceivedMessageHandling();

  void onTap({
    MessagingType? type,
    num? postId,
    num? userId,
  }) {
    if (type == MessagingType.like) {
      _receivedLikeHandle(userId);
    } else if (type == MessagingType.comment) {
      _receivedCommentHandle(postId);
    } else if (type == MessagingType.replay) {
      _receivedCommentHandle(postId);
    } else if (type == MessagingType.follow) {
      _receivedFollowHandle(userId);
    }
  }

  Future<void> _receivedLikeHandle(num? userID) async {
    if (userID != null) {
      AccountService.findOneUser(userID).then((result) {
        if (result != null) {
          Navigator.pushNamed(
            RepositoriesHandler.context,
            RouteTags.userPosts,
            arguments: result,
          );
        }
      });
    }
  }

  Future<void> _receivedCommentHandle(num? postID) async {
    if (postID != null) {
      PostsService.findPostById(postID).then((result) {
        if (result != null) {
          Navigator.pushNamed(
            RepositoriesHandler.context,
            RouteTags.comments,
            arguments: result,
          );
        }
      });
    }
  }

  Future<void> _receivedFollowHandle(num? userID) async {
    if (userID != null) {
      Navigator.pushNamed(
        RepositoriesHandler.context,
        RouteTags.userProfile,
        arguments: userID,
      );
    }
  }
}
