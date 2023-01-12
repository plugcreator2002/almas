import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class SettingFontsResponse extends PaginationResponse {
  SettingFontsResponse({this.data});

  SettingFontsResponse.fromJson({
    dynamic json,
    List<SettingProductModel>? data,
    PaginationParameters? pagination,
  }) {
    pagination ??= const PaginationParameters();
    if (json != null && json["fonts"] != null) {
      final items = (json["fonts"] as List).map((e) {
        return SettingProductModel.fromJson(e);
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

  List<SettingProductModel>? data;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map["fonts"] = (data ?? []).map((e) {
      return e.toJson();
    }).toList();

    return map;
  }
}
