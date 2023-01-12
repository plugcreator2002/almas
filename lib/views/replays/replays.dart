import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/comments/comments_response.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/providers/private/comments_presenter.dart';
import 'package:almas/ui_related/minors/line.dart';
import 'package:almas/views/comments/widgets/mobile/comment_card_mobile.dart';
import 'package:flutter/material.dart';

class MainReplays extends StatelessWidget {
  final CommentsResponse response;
  final CommentsPresenter presenter;
  final void Function(CommentModel model) openReplying;

  const MainReplays({
    Key? key,
    required this.response,
    required this.openReplying,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: LineVertical(
            margin: 22,
            height: 44,
            color: SystemHandler.theme.info,
          ),
        ),
        Column(
          children: (response.data ?? []).map((e) {
            return CommentCardMobile(
              model: e,
              presenter: presenter,
              openReplying: openReplying,
            );
          }).toList(),
        ),
      ],
    );
  }
}
