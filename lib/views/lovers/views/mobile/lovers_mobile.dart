import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/ui_related/cards/mobile/simple_user_card_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:flutter/material.dart';

class LoversMobile extends StatelessWidget {
  final List<UserModel> items;
  final num? userID;

  const LoversMobile({
    Key? key,
    required this.items,
    required this.userID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "lovers".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: ItemsBuilder<UserModel>(
          items: items,
          isEmpty: items.isEmpty,
          loading: "${LoadingKeys.top3Followers}$userID",
          itemBuilder: (context, index) {
            return SimpleUserCardMobile(
              model: items[index],
            );
          },
        ),
      ),
    );
  }
}
