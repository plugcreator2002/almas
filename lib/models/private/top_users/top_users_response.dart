import 'package:almas/models/private/top_users/models/account_score_model.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class TopUsersResponse extends PaginationResponse {
  TopUsersResponse({this.data});

  TopUsersResponse.fromJson({
    dynamic json,
    List<AccountScoreModel>? data,
    PaginationParameters? pagination,
  }) {
    pagination ??= const PaginationParameters();
    if (json != null && json["accountScore"] != null) {
      final items = (json["accountScore"] as List).map((e) {
        return AccountScoreModel.fromJson(e);
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

  List<AccountScoreModel>? data;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    if (data?.isNotEmpty == true) {
      map["accountScore"] = data?.map((e) {
        return e.toJson();
      }).toList();
    }

    return map;
  }
}
