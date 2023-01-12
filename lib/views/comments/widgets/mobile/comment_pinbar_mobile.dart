import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/providers/private/comments_presenter.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';

class CommentPinBarMobile extends StatelessWidget {
  final CommentModel model;
  final CommentsPresenter presenter;

  const CommentPinBarMobile({
    Key? key,
    required this.model,
    required this.presenter,
  }) : super(key: key);

  @override
  build(context) {
    return FadingButton(
      onPressEnd: () {
        final index = presenter.response.data?.indexOf(model);
        if (index != null) {
          presenter.controller.animateTo(
            index * 180,
            duration: const Duration(milliseconds: 250),
            curve: Curves.bounceInOut,
          );
        }
      },
      child: Container(
        color: SystemHandler.theme.disabled,
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "pinned-comment".tr,
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: SystemHandler.theme.info,
              ),
            ),
            Icon(
              Icons.unpublished_outlined,
              color: SystemHandler.theme.upsideSystem,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
