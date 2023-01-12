import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class BlockedResponse extends PaginationResponse {
  BlockedResponse({this.data});

  BlockedResponse.fromJson({
    dynamic json,
    List<UserModel>? data,
    PaginationParameters? pagination,
  }) {
    pagination ??= const PaginationParameters();
    if (json != null && json["blockedAccounts"] != null) {
      final items = (json["blockedAccounts"] as List).map((e) {
        return UserModel.fromJson(e);
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

  List<UserModel>? data;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    if (data?.isNotEmpty == true) {
      map["data"] = data?.map((e) {
        return e.toJson();
      }).toList();
    }

    return map;
  }
}
