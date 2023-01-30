import 'dart:ui' show VoidCallback;

import 'package:almas/controllers/public/listening_controller.dart';
import 'package:almas/controllers/public/notifications/messaging_eventings.dart';
import 'package:almas/data-server/server_interface/requests/account/account.dart';
import 'package:almas/data-server/server_interface/requests/posts/posts.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/enums.dart';
import 'package:flutter/material.dart';

const mainListening = "main-listening";
const popupListening = "popup-listening";

class OthersProfilePresenter extends Listening {
  bool loading = true;
  UserModel? _user;
  num postsCount = 0;
  num followingsCount = 0;
  num followersCount = 0;
  bool isFollowing = false;
  bool isFollower = false;
  bool isBlocking = false;

  UserModel? get user => _user;

  Future<void> follow() async {
    if (user?.id != null) {
      isFollowing = true;
      followersCount++;
      callListener(mainListening);

      final result = await AccountService.follow(user!.id);
      if (result) {
        MessagingEventing.instance.follow(user!.id);
      } else {
        isFollowing = false;
        followersCount--;
      }
      callListener(mainListening);
    }
  }

  Future<void> unfollow() async {
    if (user?.id != null) {
      isFollowing = false;
      followersCount--;
      callListener(mainListening);

      final result = await AccountService.unFollow(user!.id);
      if (result) {
      } else {
        isFollowing = true;
        followersCount++;
      }
      callListener(mainListening);
    }
  }

  void ban() async {
    if (user?.id != null) {
      final result = await AccountService.ban(user!.id);

      if (result == true) {
        user?.isActive = false;
        callListener(popupListening);
      }
    }
  }

  void unban() async {
    if (user?.id != null) {
      final result = await AccountService.unban(user!.id);

      if (result == true) {
        user?.isActive = true;
        callListener(popupListening);
      }
    }
  }

  void changeRole() async {
    if (user?.id != null) {
      UserRole? role;
      if (user?.isSupervisor == true) {
        role = UserRole.user;
      } else if ([UserRole.user, UserRole.manager].contains(
        user?.role,
      )) {
        role = UserRole.supervisor;
      }
      if (role != null) {
        final result = await AccountService.changeRole(
          user!.id,
          role.name,
        );
        if (result == true) {
          _user?.role = role;
          callAllListeners();
        }
      }
    }
  }

  void block() async {
    if (user?.id != null) {
      final result = await AccountService.block(user!.id);
      if (result) {
        isBlocking = true;
        isFollowing = false;
        callAllListeners();
      }
    }
  }

  void unblock() async {
    if (user?.id != null) {
      final result = await AccountService.unBlock(user!.id);

      if (result) {
        isBlocking = false;
        callAllListeners();
      }
    }
  }

  Future<void> getFollowsRelated(num userID) async {
    final followersCount = await AccountService.followersCount(userID);
    final followingsCount = await AccountService.followingsCount(userID);
    final postsCount = await PostsService.postsCount(userID);

    if (followersCount != null || followingsCount != null) {
      this.postsCount = postsCount ?? 0;
      this.followersCount = followersCount ?? 0;
      this.followingsCount = followingsCount ?? 0;
    }
  }

  void isFollowingOrFollower(num userID) async {
    final result = await AccountService.isFollowingOrFollower(userID);
    if (result != null) {
      isFollowing = result["isFollowing"] ?? false;
      isFollower = result["isFollower"] ?? false;
      callListener(mainListening);
    }
  }

  void isBlocked(num userID) async {
    final result = await AccountService.isBlocked(userID);
    isBlocking = result;
  }

  void init(
    num? userID, {
    VoidCallback? listener,
  }) async {
    if (listener != null) {
      addListener(mainListening, listener);
    }
    if (userID != null) {
      final result = await AccountService.findOneUser(userID);
      if (result != null) {
        _user = result;
        callListener(mainListening);
        await getFollowsRelated(userID);
        isBlocked(userID);
        isFollowingOrFollower(userID);
        loading = false;
        callListener(mainListening);
      }
    }
  }
}
