import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/styles/styles.dart';
import 'package:almas/controllers/private/comments_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/comments/comments_response.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/providers/private/comments_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/minors/row_option.dart';
import 'package:almas/ui_related/popups/mobile/comment_options_popup.dart';
import 'package:almas/ui_related/separated_pieces/mobile/post_header_tools_mobile.dart';
import 'package:almas/utils/date_related/date_handle.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:almas/views/replays/replays.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class CommentCardMobile extends StatefulWidget {
  final PostModel? post;
  final CommentModel model;
  final void Function(CommentModel model) openReplying;
  final CommentsPresenter presenter;

  const CommentCardMobile({
    Key? key,
    this.post,
    required this.model,
    required this.openReplying,
    required this.presenter,
  }) : super(key: key);

  @override
  SafeState<CommentCardMobile> createState() => _CommentCardMobileState();
}

class _CommentCardMobileState extends SafeState<CommentCardMobile> {
  bool showReplays = false;
  CommentsResponse response = CommentsResponse();

  @override
  build(context) {
    return Column(
      children: [
        Container(
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
                    account: widget.model.account,
                    accessMoreOptions: [
                      widget.model.account?.id,
                      widget.post?.account?.id,
                    ].contains(
                      RepositoriesHandler.getUserData?.id,
                    ),
                    onTapMore: () {
                      PopupOpenerBuilder.centerPopup(
                        context,
                        child: CommentOptionsPopupMobile(
                          post: widget.post,
                          model: widget.model,
                          presenter: widget.presenter,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      widget.model.content ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: StylesConfig.instance.postContent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowOption(
                    label: DateHandle.agoTimeStamp(
                      widget.model.createdAt,
                    ).toString(),
                  ),
                  Row(
                    children: [
                      RowOption(
                        labelColor: SystemHandler.theme.info,
                        label: "replay".tr,
                        onTap: () => widget.openReplying(widget.model),
                      ),
                      RowOption(
                        labelColor: SystemHandler.theme.info,
                        label: [
                          "close-replays".tr,
                          "show-replays".tr,
                        ][showReplays ? 0 : 1],
                        onTap: () {
                          if (!showReplays) {
                            CommentsController.getReplays(
                              commentID: widget.model.id,
                              callback: (response) {
                                if (response.data?.isNotEmpty == true) {
                                  setState(() {
                                    showReplays = true;
                                    this.response = response;
                                  });
                                }
                              },
                            );
                          } else {
                            setState(() {
                              showReplays = false;
                              response = CommentsResponse();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showReplays) ...[
          MainReplays(
            openReplying: widget.openReplying,
            response: response,
            presenter: widget.presenter,
          ),
        ] else ...[
          const SizedBox(height: 20),
        ]
      ],
    );
  }
}
