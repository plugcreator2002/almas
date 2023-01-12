import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/providers/index.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/minors/row_option.dart';
import 'package:flutter/material.dart';

class CommentOptionsPopupMobile extends StatelessWidget {
  final PostModel? post;
  final CommentModel model;
  final CommentsPresenter presenter;

  const CommentOptionsPopupMobile({
    Key? key,
    required this.model,
    this.post,
    required this.presenter,
  }) : super(key: key);

  bool get _accessDelete {
    final conditions = [
      post?.account?.id == RepositoriesHandler.getUserData?.id,
      model.account?.id == RepositoriesHandler.getUserData?.id,
    ];

    return conditions.contains(true);
  }

  @override
  build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_accessDelete) ...[
          RowOption(
            label: "delete".tr,
            onTap: () {
              Navigator.pop(context);
              presenter.delete(model.id);
            },
          ),
        ],
        if (post?.account?.id == RepositoriesHandler.getUserData?.id) ...[
          RowOption(
            label: model.isPinned ? "unpin".tr : "pin".tr,
            onTap: () {
              if (model.isPinned) {
                presenter.unpin(
                  model.id,
                  () => Navigator.pop(context),
                );
              } else {
                presenter.pin(
                  model.id,
                  () => Navigator.pop(context),
                );
              }
            },
          )
        ],
      ],
    );
  }
}
