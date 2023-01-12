import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class CommentsResponse extends PaginationResponse {
  CommentsResponse({this.data});

  CommentsResponse.fromJson({
    dynamic json,
    List<CommentModel>? data,
    PaginationParameters? pagination,
    String nameItems = "filteredComments",
  }) {
    pagination ??= const PaginationParameters();
    if (json != null && json[nameItems] != null) {
      final items = (json[nameItems] as List).map((e) {
        return CommentModel.fromJson(e);
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

  List<CommentModel>? data;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map["data"] = data?.map((e) => e.toJson()).toList() ?? [];
    return map;
  }
}
