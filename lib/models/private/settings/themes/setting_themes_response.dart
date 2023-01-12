import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class SettingThemesResponse extends PaginationResponse {
  SettingThemesResponse({this.data});

  SettingThemesResponse.fromJson({
    dynamic json,
    List<SettingProductModel>? data,
    PaginationParameters? pagination,
  }) {
    pagination ??= const PaginationParameters();
    if (json != null && json["themes"] != null) {
      final items = (json["themes"] as List).map((e) {
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

    map["themes"] = (data ?? []).map((e) {
      return e.toJson();
    }).toList();

    return map;
  }
}
