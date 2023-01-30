import 'dart:ui';

import 'package:almas/data-server/server_interface/requests/account/account.dart';
import 'package:almas/data-server/server_interface/requests/posts/posts.dart';
import 'package:almas/models/private/blocks/blocked_response.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:psr_base/packages.dart';

class AccountPresenter extends ParentProvider<UserModel> {
  num postsCount = 0;
  num followersCount = 0;
  num followingsCount = 0;
  UserModel profile = UserModel();
  BlockedResponse blockedResponse = BlockedResponse();

  Future<void> getProfile({
    void Function(UserModel? model)? callback,
    VoidCallback? authInvalid,
    bool update = false,
    bool moreDetails = true,
  }) async {
    final result = await AccountService.findMe();
    if (moreDetails) {
      getCounts();
    }

    if (result != null) {
      profile = result;
      if (update) {
        notifyListeners();
      }
      if (callback != null) {
        callback(profile);
      }
    } else {
      if (authInvalid != null) {
        authInvalid();
      }
    }
  }

  Future<void> getBlockedUsers([
    PaginationParameters? pagination,
    void Function(BlockedResponse response)? callback,
  ]) async {
    final response = await AccountService.blockedUsers(pagination);

    if (response != null) {
      final result = BlockedResponse.fromJson(
        json: response,
        data: blockedResponse.data,
        pagination: pagination,
      );

      if (callback != null) {
        callback(result);
        return;
      }

      blockedResponse = result;
      notifyListeners();
    }
  }

  Future<void> uploadAvatar() async {
    final xFile = await ImagePicker().pickImage(
      imageQuality: 60,
      maxWidth: 800,
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      final result = await AccountService.uploadAvatar(xFile);

      if (result != null) {
        profile.avatar = result;
        notifyListeners();
      }
    }
  }

  Future<void> uploadBackground() async {
    final xFile = await ImagePicker().pickImage(
      imageQuality: 60,
      maxWidth: 800,
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      final result = await AccountService.uploadBackground(xFile);

      if (result != null) {
        profile.background = result;
        notifyListeners();
      }
    }
  }

  Future<void> updateProfile({
    required Map<String, dynamic> form,
    required VoidCallback callback,
  }) async {
    final result = await AccountService.update(form: form);

    if (result != null) {
      profile = result;
      notifyListeners();
      RepositoriesHandler.saveUserData(result);
      callback();
    }
  }

  Future<void> updatePassword({
    required Map<String, dynamic> form,
    required VoidCallback callback,
  }) async {
    final result = await AccountService.updatePassword(form: form);

    if (result) {
      callback();
    }
  }

  Future<void> getCounts() async {
    final id = RepositoriesHandler.getUserData?.id;
    if (id == null) return;
    final followersCount = await AccountService.followersCount(id);
    final followingsCount = await AccountService.followingsCount(id);
    final postsCount = await PostsService.postsCount(id);

    if (followersCount != null || followingsCount != null) {
      this.followersCount = followersCount ?? 0;
      this.followingsCount = followingsCount ?? 0;
      this.postsCount = postsCount ?? 0;
      notifyListeners();
    }
  }

  @override
  void init([UserModel? data]) {
    super.init(data);
    if (data != null) {
      profile = data;
    }
  }

  @override
  void dispose() {
    super.dispose();
    profile = UserModel();
  }
}
