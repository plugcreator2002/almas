import 'package:almas/config/constants/listening_keys.dart';
import 'package:almas/controllers/public/listening_controller.dart';
import 'package:almas/data-server/server_interface/requests/account/account.dart';
import 'package:almas/models/private/accounts/accounts_response.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';

class FollowsPresenter extends Listening {
  AccountsResponse followers = AccountsResponse();
  AccountsResponse followings = AccountsResponse();

  Future<void> getFollowers(
    num? userID, [
    PaginationParameters? pagination,
  ]) async {
    if (userID == null) return;
    final response = await AccountService.followers(userID, pagination);

    if (response != null) {
      final result = AccountsResponse.fromJson(
        json: response,
        data: followers.data,
        pagination: pagination,
      );

      followers = result;
      callListener(ListeningKeys.followersScreen);
    }
  }

  Future<void> getFollowings(
    num? userID, [
    PaginationParameters? pagination,
  ]) async {
    if (userID == null) return;
    final response = await AccountService.followings(userID, pagination);

    if (response != null) {
      final result = AccountsResponse.fromJson(
        json: response,
        data: followings.data,
        pagination: pagination,
      );

      followings = result;
      callListener(ListeningKeys.followingsScreen);
    }
  }

  Future<void> getTop3Followers(
    num? userID,
    void Function(List<UserModel> items) callback,
  ) async {
    if (userID == null) return;
    final result = await AccountService.top3Followers(userID);

    if (result.isNotEmpty) {
      final items = result.map((e) {
        return UserModel.fromJson(e);
      }).toList();

      callback(items);
    }
  }

  Future<void> getTop3Followings(
    num? userID,
    void Function(List<UserModel> items) callback,
  ) async {
    if (userID == null) return;
    final result = await AccountService.top3Followings(userID);

    if (result.isNotEmpty) {
      final items = result.map((e) {
        return UserModel.fromJson(e);
      }).toList();

      callback(items);
    }
  }
}
