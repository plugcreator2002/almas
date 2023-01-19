import 'dart:async';

import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/public/enums.dart' show PostsType;
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/requests/const.dart';
import 'package:psr_base/utils/logger.dart';

class PostsService {
  static Future<dynamic> findPosts(
    PostsType type, [
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.findPosts}/${type.name}",
      interfaceOptions: ServerInterfaceOptions(
        loading: type.name,
        hasUpdateLoading: false,
        data: pagination.toJson(),
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["filteredPosts"] != null,
      response.data["filteredPosts"] is List,
    ];
    if (conditions.contains(false)) {
      return null;
    }
    return response.data;
  }

  static Future<PostModel?> findPostById(num id) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.findPostById}/$id",
    );

    if (response.isSuccess && response.data != null) {
      final result = PostModel.fromJson(response.data);
      return result;
    }
    return null;
  }

  static Future<dynamic> getPrivatePosts(
    num userID, [
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.findPostsByUser}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.userPosts}$userID",
        hasUpdateLoading: false,
        data: pagination.toJson(),
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["posts"] != null && response.data["posts"] is List
    ];

    if (conditions[0] && conditions[1]) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> create({required String content}) async {
    final response = await ServerInterface.instance.post(
      path: RoutesAPI.postCreate,
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.createPost,
        data: {"content": content},
      ),
    );

    return response.data;
  }

  static Future<bool> update(num id, String content) async {
    final response = await ServerInterface.instance.patch(
      path: "${RoutesAPI.postUpdate}/$id",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.updatePost,
        data: {"content": content},
      ),
    );

    return response.isSuccess;
  }

  static Future<bool> report({
    required String? id,
    required String reason,
  }) async {
    // final response = await HttpRequest.put(
    //   path: reportPostPath(id),
    //   body: {"reason": reason},
    // );
    //
    // if (response != null && response == "ok") {
    //   return true;
    // }
    //
    return false;
  }

  static Future<bool> remove(num postID, [num? userID]) async {
    final response = await ServerInterface.instance.delete(
      path: "${RoutesAPI.postDelete}/$postID/${userID ?? ""}",
    );

    logger(
      "++++++++++++++++++______________%%%%%%%%%%%%% ${response.statusCode}",
    );
    return response.isSuccess;
  }

  static Future<bool> like(num id) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.postLike}/$id",
    );

    return response.isSuccess;
  }

  static Future<num?> postsCount(num id) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.postCount}/$id",
    );

    if (response.isSuccess && response.data is num) {
      return response.data;
    }
    return null;
  }
}
