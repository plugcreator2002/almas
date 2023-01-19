import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/models/server_response.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/requests/const.dart';
import 'package:share_plus/share_plus.dart' show XFile;

class AccountService {
  static Future<UserModel?> findMe() async {
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.accountMe,
    );

    if (response.isSuccess && response.data != null) {
      final result = UserModel.fromJson(response.data);
      return result;
    }
    return null;
  }

  static Future<UserModel?> findOneUser(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountFindOne}/$userID",
    );

    if (response.isSuccess && response.data != null) {
      final result = UserModel.fromJson(response.data);
      return result;
    }
    return null;
  }

  static Future<dynamic> blockedUsers(
    PaginationParameters? pagination,
  ) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.accountBlocked,
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.blockedUsers,
        hasUpdateLoading: false,
        data: pagination.toJson(),
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["blockedAccounts"] != null,
      response.data["blockedAccounts"] is List,
    ];

    if (conditions[0] && conditions[1] && conditions[2]) {
      return response.data;
    }
    return null;
  }

  static Future<List<dynamic>> searchUsers(String content) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountSearchByUsername}/$content",
    );

    if (response.isSuccess && response.data != null) {
      return response.data as List;
    }
    return [];
  }

  static Future<ServerResponse> forgotPassword(String email) async {
    final response = await ServerInterface.instance.post(
      path: RoutesAPI.accountForgotPassword,
      interfaceOptions: ServerInterfaceOptions(
        needToken: false,
        loading: LoadingKeys.forgotPassword,
        checkExpiredToken: false,
        successfulToast: true,
        data: {"email": email},
      ),
    );

    return response;
  }

  static Future<String?> uploadAvatar(XFile file) async {
    final response = await ServerInterface.instance.upload(
      RoutesAPI.accountUploadAvatar,
      file: file,
      field: "avatar",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.uploadingAvatar,
      ),
    );

    final conditions = [
      response.isSuccess,
      response.data != null,
      response.data is String,
    ];

    if (conditions.contains(false)) {
      return null;
    }
    return response.data;
  }

  static Future<String?> uploadBackground(XFile file) async {
    final response = await ServerInterface.instance.upload(
      RoutesAPI.accountUploadBackground,
      file: file,
      field: "background",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.uploadingBackground,
      ),
    );

    final conditions = [
      response.isSuccess,
      response.data != null,
      response.data is String,
    ];

    if (conditions.contains(false)) {
      return null;
    }
    return response.data;
  }

  static Future<UserModel?> update({
    required Map<String, dynamic> form,
  }) async {
    final response = await ServerInterface.instance.patch(
      path: RoutesAPI.accountUpdate,
      interfaceOptions: ServerInterfaceOptions(
        data: form,
        successfulToast: true,
        loading: LoadingKeys.updateProfile,
      ),
    );

    if (response.isSuccess && response.data != null) {
      final result = UserModel.fromJson(response.data);
      return result;
    }
    return null;
  }

  static Future<bool> updatePassword({
    required Map<String, dynamic> form,
  }) async {
    final response = await ServerInterface.instance.patch(
      path: RoutesAPI.accountUpdatePassword,
      interfaceOptions: ServerInterfaceOptions(
        data: form,
        successfulToast: true,
        loading: LoadingKeys.updatePassword,
      ),
    );

    if (response.isSuccess && response.data != null) {
      // ServerInterface.instance.header["Authorization"] = response.data;
      // RepositoriesHandler.saveToken(response.data);
      return true;
    }
    return false;
  }

  static Future<bool> follow(num userID) async {
    final response = await ServerInterface.instance.put(
      path: "${RoutesAPI.accountFollow}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.follows,
      ),
    );

    return response.isSuccess;
  }

  static Future<bool> unFollow(num userID) async {
    final response = await ServerInterface.instance.put(
      path: "${RoutesAPI.accountUnfollow}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.follows,
      ),
    );

    return response.isSuccess;
  }

  static Future<bool> block(num userID) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.accountBlock}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.blockUser,
      ),
    );

    return response.isSuccess;
  }

  static Future<bool> unBlock(num userID) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.accountUnBlock}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.unBlockUser,
      ),
    );

    return response.isSuccess;
  }

  static Future<bool?> ban(num userID) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.accountBan}/$userID",
    );

    return response.isSuccess;
  }

  static Future<bool?> unban(num userID) async {
    final response = await ServerInterface.instance.post(
      path: "${RoutesAPI.accountUnBan}/$userID",
    );

    return response.isSuccess;
  }

  static Future<bool?> changeRole(num userID, String newRole) async {
    final response = await ServerInterface.instance.patch(
      path: "${RoutesAPI.accountChangeRole}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        // successfulToast: true,
        data: {"type": newRole},
      ),
    );

    return response.isSuccess;
  }

  static Future<dynamic> followings(
    num userID, [
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountFollowings}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.followings}$userID",
        hasUpdateLoading: false,
        data: pagination.toJson(),
      ),
    );

    if (response.isSuccess) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> followers(
    num userID, [
    PaginationParameters? pagination,
  ]) async {
    pagination ??= const PaginationParameters();
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountFollowers}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.followers}$userID",
        hasUpdateLoading: false,
        data: pagination.toJson(),
      ),
    );

    if (response.isSuccess) {
      return response.data;
    }
    return null;
  }

  static Future<List<dynamic>> top3Followers(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountTop3Followers}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.top3Followers}$userID",
        hasUpdateLoading: false,
      ),
    );

    if (response.isSuccess && response.data != null) {
      return response.data as List;
    }
    return [];
  }

  static Future<List<dynamic>> top3Followings(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountTop3Followings}/$userID",
      interfaceOptions: ServerInterfaceOptions(
        loading: "${LoadingKeys.top3Followings}$userID",
        hasUpdateLoading: false,
      ),
    );

    if (response.isSuccess && response.data != null) {
      return response.data as List;
    }
    return [];
  }

  static Future<num?> followingsCount(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountFollowingsCount}/$userID",
    );

    if (response.isSuccess && response.data is num) {
      return response.data;
    }
    return null;
  }

  static Future<num?> followersCount(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountFollowersCount}/$userID",
    );

    if (response.isSuccess && response.data is num) {
      return response.data;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> isFollowingOrFollower(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountISFollowingOrFollower}/$userID",
    );

    if (response.isSuccess) {
      return response.data;
    }
    return null;
  }

  static Future<bool?> isFollowing(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountISFollowing}/$userID",
    );

    if (response.isSuccess && response.data is bool?) {
      return response.data;
    }
    return null;
  }

  static Future<bool?> isFollower(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountISFollower}/$userID",
    );

    if (response.isSuccess && response.data is bool?) {
      return response.data;
    }
    return null;
  }

  static Future<bool> isBlocked(num userID) async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.accountISBlocked}/$userID",
    );

    if (response.isSuccess && response.data != null) {
      return response.data as bool;
    }
    return false;
  }
}
