// ignore_for_file: use_build_context_synchronously
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/models/public/enums.dart';
import 'package:almas/providers/private/others_profile_presenter.dart';
import 'package:almas/repositories/permissions/role_permissions.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:flutter/widgets.dart';

class OthersProfileController extends OthersProfilePresenter {
  bool get accessChangeRole {
    final hasBeen = [
      UserRole.user,
      UserRole.supervisor,
    ].contains(user?.role);

    if (RolePermissions.isAdmin(RepositoriesHandler.userData?.role) &&
        hasBeen) {
      return true;
    }
    return false;
  }

  String get nameChangingRole {
    if (RolePermissions.isSupervisor(user?.role)) {
      return "set-as-un-moderator".tr;
    } else if (user?.role == UserRole.user) {
      return "set-as-moderator".tr;
    }
    return "";
  }

  String get nameStatusBan {
    // if (user?.isBanned == true) {
    //   return "un-ban".tr;
    // } else if (user?.isBanned == false) {
    //   return "ban".tr;
    // }
    return "";
  }

  bool get accessMenuOptions {
    if (RolePermissions.isUser(RepositoriesHandler.userData?.role)) {
      return user?.role != UserRole.admin || user?.role != UserRole.manager;
    }

    return true;
  }

  String get followsStatus {
    if (isBlocking) {
      return "unblock".tr;
    } else {
      if (isFollowing) {
        return "unfollow".tr;
      } else {
        return "follow".tr;
      }
    }
  }

  String get blocksStatus {
    if (isBlocking) {
      return "unblock".tr;
    } else {
      return "block".tr;
    }
  }

  void follows() {
    if (isFollowing) {
      unfollow();
    } else {
      follow();
    }
  }

  void blocks() {
    if (isBlocking) {
      unblock();
    } else {
      block();
    }
  }

  void bans() {
    // if (user?.isBanned == true) {
    //   unban();
    // } else if (user?.isBanned == false) {
    //   ban((user) {
    //     MessagingController.send(
    //       event: SubEventsSocket.ban,
    //       parameters: MessageParameters(
    //         roomID: user?.id,
    //       ),
    //     );
    //   });
    // }
  }

  Future<void> reportCover(
    BuildContext context, {
    required String reason,
    required num? userID,
    required VoidCallback callback,
  }) async {
    if (userID != null) {
      // final result = await UsersProfileService.reportCover(userID, reason);
      // if (result == true) {
      //   callback();
      //   PopupOpenerBuilder.toast(
      //     context,
      //     content: "your-report-submit".tr,
      //   );
      // }
    }
  }

  Future<void> reportAvatar(
    BuildContext context, {
    required num? userID,
    required String reason,
    required VoidCallback callback,
  }) async {
    if (userID != null) {
      // final result = await UsersProfileService.reportAvatar(userID, reason);
      // if (result == true) {
      //   callback();
      //   PopupOpenerBuilder.toast(
      //     context,
      //     content: "your-report-submit".tr,
      //   );
      // }
    }
  }
}
