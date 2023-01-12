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

class FollowingsMobile extends StatelessWidget {
  final num? userID;
  final FollowsPresenter presenter;

  const FollowingsMobile({
    Key? key,
    this.userID,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "followers".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: ItemsBuilder<UserModel>(
          morePaging: true,
          pagination: presenter.followings,
          loading: "${LoadingKeys.followings}$userID",
          isEmpty: (presenter.followings.data ?? []).isEmpty,
          items: presenter.followings.data ?? [],
          onRefresh: (pagination) {
            presenter.getFollowings(userID, pagination);
          },
          endReached: (pagination) {
            presenter.getFollowings(userID, pagination);
          },
          itemBuilder: (context, index) {
            return SimpleUserCardMobile(
              model: (presenter.followings.data ?? [])[index],
            );
          },
        ),
      ),
    );
  }
}
