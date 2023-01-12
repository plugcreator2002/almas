import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/private/posts/posts_controller.dart';
import 'package:almas/controllers/public/notifications/messaging_eventings.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/providers/private/private_posts_presenter.dart';
import 'package:almas/repositories/permissions/loggedin_permissions.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/popups/mobile/question_popup_mobile.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PrivatePostsController extends PostsController {
  final context = RepositoriesHandler.context;
  static PrivatePostsController instance = PrivatePostsController();

  void get(
    num? userID, [
    PaginationParameters? pagination,
  ]) {
    LoggedInPermissions.checkHasToken(() {
      context.read<PrivatePostsPresenter>().get(userID, pagination);
    });
  }

  @override
  Future<void> remove(num? postID, [VoidCallback? callback]) async {
    super.remove(postID);
    PopupOpenerBuilder.centerPopup<bool>(
      context,
      child: QuestionPopupMobile(
        question: "do-you-want-to-delete-this-post?".tr,
      ),
    ).then((output) {
      if (output == true) {
        context.read<PrivatePostsPresenter>().remove(postID!, callback);
      }
    });
  }

  @override
  void create(String content, [VoidCallback? callback]) {
    super.create(content);
    context.read<PrivatePostsPresenter>().create(content, callback);
  }

  @override
  void update(num? postID, String content, [VoidCallback? callback]) {
    super.update(postID, content);
    context.read<PrivatePostsPresenter>().update(postID!, content, callback);
  }

  @override
  void likes(
    bool isLiked,
    PostModel model, [
    VoidCallback? callback,
  ]) {
    final presenter = context.read<PrivatePostsPresenter>();

    if (isLiked == true) {
      presenter.unlikePost(
        model.id,
        callback,
      );
    } else if (isLiked == false) {
      presenter.likePost(
        model.id,
        () => MessagingEventing.instance.likePost(model),
      );
    }
  }
}
