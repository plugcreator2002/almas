import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/styles/styles.dart';
import 'package:almas/controllers/public/router_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/top_users/models/account_score_model.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:flutter/material.dart';

class TopUserCardMobile extends StatelessWidget {
  final AccountScoreModel model;

  const TopUserCardMobile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadingButton(
      onPressEnd: () {
        RouterController.pushProfile(
          context,
          model.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: SystemHandler.theme.system,
          borderRadius: BorderRadius.circular(8),
          boxShadow: StylesConfig.instance.mainShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  CachesImages(
                    avatarRadius: 30,
                    imageID: model.account?.avatar,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    model.account?.username ?? "",
                    style: TextStyle(
                      fontFamily: SystemHandler.family,
                      fontSize: 14,
                      color: SystemHandler.theme.upsideSystem,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${model.score} ${"score".tr}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: 12,
                color: SystemHandler.theme.upsideSystem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
