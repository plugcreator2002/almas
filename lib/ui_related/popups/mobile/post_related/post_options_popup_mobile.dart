import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/private/posts/posts_controller.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/minors/row_option.dart';
import 'package:almas/ui_related/popups/mobile/post_related/edit_post_popup_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/utils/logger.dart';
import 'package:psr_base/utils/popups/opening_popups.dart';
import 'package:share_plus/share_plus.dart';

class PostOptionsPopupMobile extends StatelessWidget {
  final PostModel model;
  final PostsController controller;

  const PostOptionsPopupMobile({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  build(context) {
    logger(model.account?.role);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (controller.access(model.account)) ...[
          if (controller.accessUpdate(model.createdAt)) ...[
            RowOption(
              label: 'edit'.tr,
              onTap: () {
                Navigator.pop(context);
                OpeningPopups.showBottomPopup(
                  context,
                  view: EditPostPopupMobile(
                    model: model,
                    controller: controller,
                  ),
                );
              },
            ),
          ],
          RowOption(
            label: 'delete'.tr,
            onTap: () {
              Navigator.pop(context);
              num? userID;
              if (model.account?.id != RepositoriesHandler.getUserData?.id) {
                userID = model.account?.id;
              }
              controller.remove(model.id, userID);
            },
          ),
        ],
        RowOption(
          label: 'copy'.tr,
          onTap: () {
            RepositoriesHandler.copy(model.content);
            Navigator.pop(context);
          },
        ),
        RowOption(
          label: 'share'.tr,
          onTap: () {
            if (model.content != null) {
              Share.share(model.content ?? "");
            }
          },
        ),
      ],
    );
  }
}
