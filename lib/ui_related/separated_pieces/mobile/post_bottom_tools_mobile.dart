import 'package:almas/config/mine_icons.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/posts/posts_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/ui_related/minors/row_option.dart';
import 'package:almas/utils/date_related/date_handle.dart';
import 'package:flutter/material.dart';

class PostBottomToolsMobile extends StatefulWidget {
  final PostsController controller;
  final PostModel model;

  const PostBottomToolsMobile({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  State<PostBottomToolsMobile> createState() {
    // ignore: no_logic_in_create_state
    return _PostBottomToolsMobileState(model);
  }
}

class _PostBottomToolsMobileState extends State<PostBottomToolsMobile> {
  bool isLiked = false;
  num likesCount = 0;
  bool actionLikes = false;

  _PostBottomToolsMobileState(PostModel model) {
    isLiked = model.isLiked;
    likesCount = model.likeCount;
  }

  @override
  build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RowOption(
          icon: MineIcons.calender,
          label: DateHandle.agoTimeStamp(
            widget.model.createdAt,
          ).toString(),
        ),
        Row(
          children: [
            RowOption(
              textDirection: TextDirection.ltr,
              label: "$likesCount",
              image: [
                SystemHandler.theme.imageGem,
                SystemHandler.theme.imageGemEmpty,
              ][isLiked == true ? 0 : 1],
              onTap: () {
                if (!actionLikes) {
                  actionLikes = true;
                  widget.controller.likes(isLiked, widget.model);
                  setState(() {
                    actionLikes = false;
                    isLiked = !isLiked;
                    if (isLiked) {
                      likesCount++;
                    } else {
                      likesCount--;
                    }
                  });
                }
              },
            ),
            const SizedBox(width: 30),
            RowOption(
              icon: MineIcons.message,
              textDirection: TextDirection.ltr,
              label: "${widget.model.commentCount}",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteTags.comments,
                  arguments: widget.model,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
