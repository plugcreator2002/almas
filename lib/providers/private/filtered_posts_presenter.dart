import 'package:almas/data-server/server_interface/requests/posts/posts.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/private/posts/posts_response.dart';
import 'package:almas/models/public/enums.dart' show PostsType;
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:flutter/scheduler.dart';

class FilteredPostsPresenter extends ParentProvider {
  PostsResponse response = PostsResponse();
  PostsType type = PostsType.explore;

  void clear() {
    response = PostsResponse();
    // notifyListeners();
  }

  Future<void> get(
    PostsType type, [
    PaginationParameters? pagination,
  ]) async {
    if (type != this.type) {
      this.response = PostsResponse();
    }
    this.type = type;
    final response = await PostsService.findPosts(type, pagination);

    if (response != null) {
      final result = PostsResponse.fromJson(
        json: response,
        data: this.response.data,
        pagination: pagination,
      );

      this.response = result;
      notifyListeners();
    }
  }

  Future<void> create(
    String content, [
    VoidCallback? callback,
  ]) async {
    final result = await PostsService.create(content: content);

    if (result != null) {
      final model = PostModel.fromJson(result);

      response.data?.insert(0, model);
      notifyListeners();

      if (callback != null) {
        callback();
      }
    }
  }

  Future<void> update(
    num postID,
    String content, [
    VoidCallback? callback,
  ]) async {
    final isUpdated = await PostsService.update(postID, content);

    if (isUpdated) {
      final index = response.data?.indexWhere((element) {
        return postID == element.id;
      });
      if (index != null) {
        response.data?[index].content = content;
        notifyListeners();
        if (callback != null) {
          callback();
        }
      }
    }
  }

  Future<void> remove(num postID, [num? userID]) async {
    final response = await PostsService.remove(postID, userID);

    if (response == true) {
      this.response.data?.removeWhere((element) {
        return element.id == postID;
      });
      notifyListeners();
    }
  }

  Future<void> likePost(num id, [VoidCallback? callback]) async {
    final result = await PostsService.like(id);

    if (result) {
      final index = response.data?.indexWhere((element) {
        return element.id == id;
      });
      if (index != null && index != -1) {
        response.data?[index].isLiked = true;
        response.data?[index].likeCount++;
        notifyListeners();
      }
      if (callback != null) {
        callback();
      }
    }
  }

  Future<void> unlikePost(num id, [VoidCallback? callback]) async {
    final result = await PostsService.like(id);

    if (result) {
      final index = response.data?.indexWhere((element) {
        return element.id == id;
      });
      if (index != null && index != -1) {
        response.data?[index].isLiked = false;
        response.data?[index].likeCount--;
        notifyListeners();
      }
      if (callback != null) {
        callback();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    response = PostsResponse();
  }
}
