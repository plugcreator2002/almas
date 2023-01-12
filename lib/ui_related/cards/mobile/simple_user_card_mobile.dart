import 'package:almas/config/styles/styles.dart';
import 'package:almas/controllers/public/router_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:flutter/material.dart';

class SimpleUserCardMobile extends StatelessWidget {
  final UserModel model;

  const SimpleUserCardMobile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  build(context) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachesImages(
              avatarRadius: 30,
              imageID: model.avatar,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                model.username ?? "",
                maxLines: 2,
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  fontSize: 14,
                  color: SystemHandler.theme.upsideSystem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
