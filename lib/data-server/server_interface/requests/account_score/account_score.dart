import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/data-server/server_interface/requests/const.dart';

class AccountScoreService {
  static Future<dynamic> accountTopScore([
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.accountTopScore,
      interfaceOptions: ServerInterfaceOptions(
        hasUpdateLoading: false,
        data: pagination.toJson(),
        loading: LoadingKeys.accountTopScore,
      ),
    );

    if (response.isSuccess && response.data != null) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> accountTopScoreWeekly([
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.accountTopWeekly,
      interfaceOptions: ServerInterfaceOptions(
        hasUpdateLoading: false,
        data: pagination.toJson(),
        loading: LoadingKeys.accountTopWeekly,
      ),
    );

    if (response.isSuccess && response.data != null) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> accountTopScoreMonthly([
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.accountTopMonthly,
      interfaceOptions: ServerInterfaceOptions(
        hasUpdateLoading: false,
        data: pagination.toJson(),
        loading: LoadingKeys.accountTopMonthly,
      ),
    );

    if (response.isSuccess && response.data != null) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> accountTopScoreYearly([
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.accountTopYearly,
      interfaceOptions: ServerInterfaceOptions(
        hasUpdateLoading: false,
        data: pagination.toJson(),
        loading: LoadingKeys.accountTopYearly,
      ),
    );

    if (response.isSuccess && response.data != null) {
      return response.data;
    }
    return null;
  }
}
