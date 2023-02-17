import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/providers/private/comments_presenter.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/inputs/input_area.dart';
import 'package:almas/ui_related/minors/line.dart';
import 'package:almas/ui_related/titles/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class CreateCommentPopupMobile extends StatefulWidget {
  final CommentModel? comment;
  final CommentsPresenter presenter;

  const CreateCommentPopupMobile({
    Key? key,
    this.comment,
    required this.presenter,
  }) : super(key: key);

  @override
  SafeState<CreateCommentPopupMobile> createState() => _State();
}

class _State extends SafeState<CreateCommentPopupMobile> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: SystemHandler.theme.system,
      child: Column(
        children: [
          CustomTitle(
            title: "submit-comment".tr,
            size: 22,
            color: SystemHandler.theme.textDisabled,
          ),
          const Line(margin: 25),
          InputArea(
            name: "comment",
            hintText: "comment-text".tr,
            maxLines: 18,
            minLines: 18,
            onChanged: (content) => this.content = content,
          ),
          const SizedBox(height: 15),
          MainButtonMobile(
            height: 50,
            validate: () => content.isNotEmpty,
            loadingKey: LoadingKeys.createComment,
            label: "send".tr,
            onTap: () {
              widget.presenter.create(
                content: content,
                comment: widget.comment,
                callback: () => Navigator.pop(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
