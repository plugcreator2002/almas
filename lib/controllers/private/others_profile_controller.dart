// ignore_for_file: use_build_context_synchronously
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/models/public/enums.dart';
import 'package:almas/providers/private/others_profile_presenter.dart';
import 'package:almas/repositories/permissions/role_permissions.dart';
import 'package:almas/repositories/repositories_handler.dart';

class OthersProfileController extends OthersProfilePresenter {
  bool get accessChangeRole {
    final hasBeen = [
      UserRole.user,
      UserRole.supervisor,
    ].contains(user?.role);

    final conditions = [
      hasBeen,
      RolePermissions.isAdmin(RepositoriesHandler.userData?.role)
    ];
    if (conditions.contains(false)) {
      return false;
    }
    return true;
  }

  String get nameChangingRole {
    if (RolePermissions.isSupervisor(user?.role)) {
      return "set-as-un-moderator".tr;
    } else if ([UserRole.user, UserRole.manager].contains(
      user?.role,
    )) {
      return "set-as-moderator".tr;
    }
    return "";
  }

  bool get accessBanUser {
    final conditions = [
      RolePermissions.isAdmin(RepositoriesHandler.userData?.role),
      RolePermissions.isSupervisor(RepositoriesHandler.userData?.role),
    ];
    return conditions.contains(true) && user?.isAdmin == false;
  }

  String get nameStatusBan {
    if (user?.isActive == true) {
      return "ban".tr;
    } else if (user?.isActive == false) {
      return "un-ban".tr;
    }
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
        return "you-follow".tr;
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
    if (user?.isActive == true) {
      ban();
    } else if (user?.isActive == false) {
      unban();
    }
  }
}
