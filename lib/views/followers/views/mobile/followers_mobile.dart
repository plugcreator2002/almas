import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/private/follows_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/ui_related/cards/mobile/simple_user_card_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:flutter/material.dart';

class FollowersMobile extends StatelessWidget {
  final num? userID;
  final FollowsPresenter presenter;

  const FollowersMobile({
    Key? key,
    required this.userID,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "followings".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: ItemsBuilder<UserModel>(
          morePaging: true,
          pagination: presenter.followers,
          loading: "${LoadingKeys.followers}$userID",
          isEmpty: (presenter.followers.data ?? []).isEmpty,
          items: presenter.followers.data ?? [],
          onRefresh: (pagination) {
            presenter.getFollowers(userID, pagination);
          },
          endReached: (pagination) {
            presenter.getFollowers(userID, pagination);
          },
          itemBuilder: (context, index) {
            return SimpleUserCardMobile(
              model: (presenter.followers.data ?? [])[index],
            );
          },
        ),
      ),
    );
  }
}
