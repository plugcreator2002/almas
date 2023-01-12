import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/rest_api/http_request.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/enums.dart' show UserRole;
import 'package:almas/requests/users_profile/const.dart';

class UsersProfileService {
  static Future<UserModel?> getUser(num userID) async {
    final response = await HttpRequest.get(
      path: "$getUserPath$userID",
      body: {},
    );

    if (response != null && response["_id"] != null) {
      final user = UserModel.fromJson(response);
      return user;
    }
    return null;
  }

  static Future<bool?> changeRole({
    num? userID,
    required UserRole role,
  }) async {
    final response = await HttpRequest.put(
      path: "$changeRolePath$userID",
      body: {},
    );

    if (response != null) {
      return true;
    }
    return null;
  }

  static Future<bool?> follow(num userID) async {
    final response = await HttpRequest.put(
      path: followsUser(userID, followPath),
      loading: LoadingKeys.follows,
      body: {},
    );

    if (response != null && response["message"] == "successfully following") {
      return true;
    }
    return null;
  }

  static Future<bool?> unFollow(num userID) async {
    final response = await HttpRequest.put(
      path: followsUser(userID, unfollowPath),
      loading: LoadingKeys.follows,
      body: {},
    );

    if (response != null && response["message"] == "successfully unfollowed") {
      return false;
    }
    return true;
  }

  static Future<bool?> block(num userID) async {
    final response = await HttpRequest.put(
      path: followsUser(userID, blockPath),
      body: {},
    );

    if (response != null && response == "you've blocked this user") {
      return true;
    }
    return null;
  }

  static Future<bool?> unBlock(num userID) async {
    final response = await HttpRequest.put(
      path: blocksUser(userID, unBlockPath),
      body: {},
    );

    const message = "you've unblocked this user";
    if (response != null && response == message) {
      return false;
    }
    return null;
  }

  static Future<bool?> reportCover(num userID, String reason) async {
    final response = await HttpRequest.put(
      path: reportUser(userID, reportCoverPath),
      body: {
        "reason": reason,
      },
    );

    if (response != null && response == "ok") {
      return true;
    }
    return null;
  }

  static Future<bool?> reportAvatar(num userID, String reason) async {
    final response = await HttpRequest.put(
      path: reportUser(userID, reportAvatarPath),
      body: {
        "reason": reason,
      },
    );

    if (response != null && response == "ok") {
      return true;
    }
    return null;
  }

  static Future<bool?> isFollowing(num userID) async {
    final response = await HttpRequest.get(
      path: "$isFollowingPath?userId=$userID",
    );

    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<bool?> isBlocking(num userID) async {
    final response = await HttpRequest.get(
      path: "$isBlockingPath?userId=$userID",
    );

    if (response != null) {
      return response;
    }
    return null;
  }
}
