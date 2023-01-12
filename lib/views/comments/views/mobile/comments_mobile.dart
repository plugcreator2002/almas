import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/providers/private/comments_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/ui_related/buttons/floating_button.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/popups/mobile/create_comment_popup_mobile.dart';
import 'package:almas/views/comments/widgets/mobile/comment_card_mobile.dart';
import 'package:almas/views/comments/widgets/mobile/comment_pinbar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/utils/popups/opening_popups.dart';

class CommentsMobile extends StatelessWidget {
  final CommentsPresenter presenter;

  const CommentsMobile({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  build(context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      floatingActionButton: FloatingButtonMobile(
        icon: Icons.add,
        onTap: () {
          OpeningPopups.showBottomPopup(
            context,
            view: CreateCommentPopupMobile(
              presenter: presenter,
            ),
          );
        },
      ),
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "comments".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: Column(
          children: [
            if (presenter.pinned != null) ...[
              CommentPinBarMobile(
                model: presenter.pinned!,
                presenter: presenter,
              ),
            ],
            Expanded(
              child: ItemsBuilder<CommentModel>(
                morePaging: true,
                loading: "${LoadingKeys.comments}${presenter.post.id}",
                isEmpty: presenter.response.data?.isEmpty,
                pagination: presenter.response,
                onRefresh: (pagination) => presenter.get(pagination),
                endReached: (pagination) => presenter.get(pagination),
                items: presenter.response.data ?? [],
                controller: presenter.controller,
                itemBuilder: (context, index) {
                  final element = (presenter.response.data ?? [])[index];

                  return CommentCardMobile(
                    model: element,
                    post: presenter.post,
                    presenter: presenter,
                    openReplying: (model) {
                      OpeningPopups.showBottomPopup(
                        context,
                        view: CreateCommentPopupMobile(
                          comment: model,
                          presenter: presenter,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
