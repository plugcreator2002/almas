import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class PostsResponse extends PaginationResponse {
  PostsResponse({this.data});

  PostsResponse.fromJson({
    dynamic json,
    List<PostModel>? data,
    PaginationParameters? pagination,
    String nameItems = "filteredPosts",
  }) {
    pagination ??= const PaginationParameters();
    if (json != null && json[nameItems] != null) {
      final items = (json[nameItems] as List).map((e) {
        return PostModel.fromJson(e);
      }).toList();

      if (pagination.isRefresh || pagination.page == super.page) {
        data = [];
        this.data = [];
      }

      if (pagination.page == 1) {
        this.data = items;
      } else {
        this.data = data;
        this.data?.addAll(items);
      }

      super.fromJsonPagination(json, pagination.page);
    }
  }

  List<PostModel>? data;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map["posts"] = (data ?? []).map((e) {
      return e.toJson();
    }).toList();

    return map;
  }
}
