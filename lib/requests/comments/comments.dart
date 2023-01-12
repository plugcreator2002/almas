import 'dart:async';

import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/requests/const.dart';

class CommentsService {
  static Future<dynamic> getComments(
    num postID,
    PaginationParameters? pagination,
  ) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.findComments}/$postID${pagination.parameters}",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.comments}$postID",
        hasUpdateLoading: false,
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["filteredComments"] != null,
      response.data["filteredComments"] is List,
    ];

    if (conditions.contains(false)) {
      return null;
    }
    return response.data;
  }

  static Future<dynamic> getReplays(num? commentID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.findReplies}/$commentID",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.replays}$commentID",
        hasUpdateLoading: false,
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["filteredReplies"] != null,
      response.data["filteredReplies"] is List,
    ];

    if (conditions.contains(false)) {
      return null;
    }
    return response.data;
  }

  static Future<bool> delete(num commentID) async {
    final response = await ServerInterface.instance.delete(
      path: "${RoutesAPI.deleteComment}/$commentID",
    );
    return response.isSuccess;
  }

  static Future<CommentModel?> pin(num commentID) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.commentPin}/$commentID",
    );

    if (response.isSuccess && response.data != null) {
      final model = CommentModel.fromJson(response.data);
      return model;
    }
    return null;
  }

  static Future<CommentModel?> unpin(num commentID) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.commentUnPin}/$commentID",
    );

    if (response.isSuccess && response.data != null) {
      final model = CommentModel.fromJson(response.data);
      return model;
    }
    return null;
  }

  static Future<CommentModel?> createComment({
    required num? id,
    required String content,
  }) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.createComment}/$id",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.createComment,
        data: {"content": content},
      ),
    );

    if (response.isSuccess && response.data != null) {
      final model = CommentModel.fromJson(response.data);
      return model;
    }
    return null;
  }

  static Future<dynamic> createReply({
    required num commentID,
    required String content,
  }) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.createReplay}/$commentID",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.createComment,
        data: {"content": content},
      ),
    );

    if (response.isSuccess && response.data != null) {
      final model = CommentModel.fromJson(response.data);
      return model;
    }
    return null;
  }
}
