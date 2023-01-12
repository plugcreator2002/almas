import 'dart:ui';

import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/models/public/enums.dart' show UserRole;
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/utils/date_related/date_handle.dart';

abstract class PostsController {
  bool access(UserModel? user) {
    if ([
      user?.id == RepositoriesHandler.userData?.id,
      UserRole.admin == RepositoriesHandler.userData?.role,
    ].contains(true)) {
      return true;
    }

    return false;
  }

  bool accessUpdate(String? created) {
    if (created == null) return false;
    final date = DateHandle.stringToDate(created);
    if (date != null) {
      final difference = DateTime.now().difference(date);
      if (difference.inHours <= 1) {
        return true;
      }
    }
    return false;
  }

  void remove(num? postID) {
    if (postID == null) return;
  }

  void create(String content, [VoidCallback? callback]) {
    if (content.trim().isEmpty) return;
  }

  void update(num? postID, String content, [VoidCallback? callback]) {
    if (postID == null || content.trim().isEmpty) return;
  }

  void likes(
    bool isLiked,
    PostModel model, [
    VoidCallback? callback,
  ]);
}
