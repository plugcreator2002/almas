import 'dart:async';

import 'package:almas/config/constants/listening_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/listening_controller.dart';
import 'package:almas/controllers/public/notifications/messaging_eventings.dart';
import 'package:almas/data-server/server_interface/requests/comments/comments.dart';
import 'package:almas/models/private/comments/comments_response.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/popups/mobile/question_popup_mobile.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:flutter/cupertino.dart';

class CommentsPresenter extends Listening {
  late PostModel post;
  final controller = ScrollController();
  CommentsResponse response = CommentsResponse();

  void sort() {
    response.data?.sort((a, b) {
      if (a.isPinned == true) return 0;
      return 1;
    });
  }

  CommentModel? get pinned {
    final model = response.data?.firstWhere((element) {
      return element.isPinned == true;
    }, orElse: () => CommentModel());

    if (model?.id != -1) {
      return model;
    }

    return null;
  }

  void create({
    CommentModel? comment,
    required String content,
    required void Function() callback,
  }) {
    if (comment != null) {
      createReply(
        comment.id,
        content: content,
        callback: () {
          callback();
          MessagingEventing.instance.replyComment(
            post,
            comment,
          );
        },
      );
    } else {
      createComment(
        post.id,
        content: content,
        callback: () {
          callback();
          MessagingEventing.instance.createComment(post);
        },
      );
    }
  }

  Future<void> createComment(
    num id, {
    required String content,
    required void Function() callback,
  }) async {
    final result = await CommentsService.createComment(
      id: id,
      content: content,
    );

    if (result != null) {
      response.data?.insert(0, result);
      callListener(ListeningKeys.commentsScreen);
      callback();
    }
  }

  Future<void> createReply(
    num commentID, {
    required String content,
    required void Function() callback,
  }) async {
    final result = await CommentsService.createReply(
      commentID: commentID,
      content: content,
    );

    if (result != null) {
      callback();
    }
  }

  Future<void> get([PaginationParameters? pagination]) async {
    final response = await CommentsService.getComments(
      post.id,
      pagination,
    );

    if (response != null) {
      final result = CommentsResponse.fromJson(
        json: response,
        data: this.response.data,
        pagination: pagination,
      );

      this.response = result;
      callListener(ListeningKeys.commentsScreen);
    }
  }

  Future<void> delete(num commentID) async {
    PopupOpenerBuilder.centerPopup<bool>(
      RepositoriesHandler.context,
      child: QuestionPopupMobile(
        question: "do-you-want-to-delete-this-comment?".tr,
      ),
    ).then((output) async {
      if (output == true) {
        final result = await CommentsService.delete(commentID);

        if (result) {
          response.data?.removeWhere((element) {
            return commentID == element.id;
          });
          callListener(ListeningKeys.commentsScreen);
        }
      }
    });
  }

  Future<void> pin(
    num commentID,
    VoidCallback callback,
  ) async {
    final result = await CommentsService.pin(commentID);

    if (result != null) {
      final index = response.data?.indexWhere((element) {
        return element.id == commentID;
      });
      if (index != null) {
        (response.data ?? [])[index].pinned = 1;
        callListener(ListeningKeys.commentsScreen);
        callback();
      }
    }
  }

  Future<void> unpin(
    num commentID,
    VoidCallback callback,
  ) async {
    final result = await CommentsService.unpin(commentID);

    if (result != null) {
      final index = response.data?.indexWhere((element) {
        return element.id == commentID;
      });
      if (index != null) {
        (response.data ?? [])[index].pinned = 0;
        callListener(ListeningKeys.commentsScreen);
        callback();
      }
    }
  }

  void init(PostModel? model, VoidCallback? listener) {
    if (listener != null) {
      addListener(
        ListeningKeys.commentsScreen,
        listener,
      );
    }
    if (model != null) {
      post = model;
      get();
    }
  }
}
