import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class PaginationController {
  static PaginationParameters pagination(
    PaginationResponse response, {
    bool isRefresh = false,
  }) {
    final maxPage = (response.total / response.limit).ceil();
    num page;
    if (response.page < maxPage) {
      page = response.page + 1;
    } else {
      page = response.page;
    }
    return PaginationParameters(
      page: page,
      limit: response.limit,
      isRefresh: isRefresh,
    );
  }

  static bool couldPaginate(PaginationResponse? response) {
    if (response == null) return false;
    final maxPage = (response.total / response.limit).ceil();
    if (response.page < maxPage) return true;
    return false;
  }
}
