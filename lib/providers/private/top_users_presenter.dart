import 'package:almas/models/private/top_users/top_users_response.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:almas/requests/account_score/account_score.dart';

class TopUsersPresenter extends ParentProvider {
  TopUsersResponse topScoreWeekly = TopUsersResponse();
  TopUsersResponse topScoreMonthly = TopUsersResponse();
  TopUsersResponse topScoreYearly = TopUsersResponse();

  Future<void> getAccountTopWeekly([
    PaginationParameters? pagination,
  ]) async {
    final response = await AccountScoreService.accountTopScoreWeekly(
      pagination,
    );

    if (response != null) {
      final result = TopUsersResponse.fromJson(
        json: response,
        data: topScoreWeekly.data,
        pagination: pagination,
      );

      topScoreWeekly = result;
      notifyListeners();
    }
  }

  Future<void> getAccountTopMonthly([
    PaginationParameters? pagination,
  ]) async {
    final response = await AccountScoreService.accountTopScoreMonthly(
      pagination,
    );

    if (response != null) {
      final result = TopUsersResponse.fromJson(
        json: response,
        data: topScoreMonthly.data,
        pagination: pagination,
      );

      topScoreMonthly = result;
      notifyListeners();
    }
  }

  Future<void> getAccountTopYearly([
    PaginationParameters? pagination,
  ]) async {
    final response = await AccountScoreService.accountTopScoreYearly(
      pagination,
    );

    if (response != null) {
      final result = TopUsersResponse.fromJson(
        json: response,
        data: topScoreYearly.data,
        pagination: pagination,
      );

      topScoreYearly = result;
      notifyListeners();
    }
  }
}
