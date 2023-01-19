import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/posts/private_posts_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/providers/private/private_posts_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/ui_related/buttons/floating_button.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/popups/mobile/post_related/create_post_popup_mobile.dart';
import 'package:almas/views/posts/widgets/mobile/post_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/utils/popups/opening_popups.dart';

class PrivatePostsMobile extends StatelessWidget {
  final UserModel? model;

  const PrivatePostsMobile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  build(context) {
    final presenter = Provider.of<PrivatePostsPresenter>(context);

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      floatingActionButton: FloatingButtonMobile(
        onTap: () {
          OpeningPopups.showBottomPopup(
            context,
            view: CreatePostPopupMobile(
              controller: PrivatePostsController.instance,
            ),
          );
        },
      ),
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "${model?.username ?? ""}@",
          actions: [
            OptionsPressed(
              icon: Icons.search_rounded,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteTags.searchPosts,
                );
              },
            ),
          ],
        ),
      ),
      body: BackgroundBuilder(
        child: ItemsBuilder<PostModel>(
          items: presenter.response.data ?? [],
          pagination: presenter.response,
          morePaging: true,
          loading: "${LoadingKeys.userPosts}${model?.id}",
          isEmpty: (presenter.response.data ?? []).isEmpty,
          onRefresh: (pagination) {
            PrivatePostsController.instance.get(model?.id, pagination);
          },
          endReached: (pagination) {
            PrivatePostsController.instance.get(model?.id, pagination);
          },
          itemBuilder: (context, index) {
            return PostCardMobile(
              hasClick: false,
              controller: PrivatePostsController.instance,
              model: (presenter.response.data ?? [])[index],
            );
          },
        ),
      ),
    );
  }
}
