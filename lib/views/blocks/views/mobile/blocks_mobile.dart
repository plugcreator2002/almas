import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/ui_related/cards/mobile/simple_user_card_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlocksMobile extends StatelessWidget {
  const BlocksMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<AccountPresenter>(context);

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "blocks".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: ItemsBuilder<UserModel>(
          items: presenter.blockedResponse.data ?? [],
          loading: LoadingKeys.blockedUsers,
          isEmpty: (presenter.blockedResponse.data ?? []).isEmpty,
          onRefresh: (pagination) => presenter.getBlockedUsers(pagination),
          endReached: (pagination) => presenter.getBlockedUsers(pagination),
          itemBuilder: (context, index) {
            return SimpleUserCardMobile(
              model: (presenter.blockedResponse.data ?? [])[index],
            );
          },
        ),
      ),
    );
  }
}
