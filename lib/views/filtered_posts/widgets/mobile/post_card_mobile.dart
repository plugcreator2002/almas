import 'package:almas/config/routes/const.dart';
import 'package:almas/config/styles/styles.dart';
import 'package:almas/controllers/private/posts/posts_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/ui_related/popups/mobile/post_related/post_options_popup_mobile.dart';
import 'package:almas/ui_related/separated_pieces/mobile/post_bottom_tools_mobile.dart';
import 'package:almas/ui_related/separated_pieces/mobile/post_header_tools_mobile.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:flutter/material.dart';

class PostCardMobile extends StatelessWidget {
  final PostsController controller;
  final bool hasClick;
  final PostModel model;

  const PostCardMobile({
    Key? key,
    required this.model,
    this.hasClick = true,
    required this.controller,
  }) : super(key: key);

  @override
  build(context) {
    return GestureDetector(
      onTap: () {
        if (hasClick) {
          Navigator.pushNamed(
            context,
            RouteTags.userPosts,
            arguments: model.account,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        constraints: const BoxConstraints(
          minHeight: 180,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6.9,
          vertical: 6.9,
        ),
        decoration: BoxDecoration(
          color: SystemHandler.theme.system,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            width: 1,
            color: SystemHandler.theme.disabled,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeaderToolsMobile(
                  account: model.account,
                  onTapMore: () {
                    PopupOpenerBuilder.centerPopup(
                      context,
                      child: PostOptionsPopupMobile(
                        model: model,
                        controller: controller,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    (model.content ?? "").trim(),
                    style: StylesConfig.instance.postContent,
                  ),
                ),
              ],
            ),
            PostBottomToolsMobile(
              key: UniqueKey(),
              model: model,
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
