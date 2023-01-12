import 'package:almas/controllers/public/router_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/builders/role_builder.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:flutter/material.dart';

class SearchUserCardMobile extends StatelessWidget {
  final UserModel model;

  const SearchUserCardMobile({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CachesImages(
              avatarRadius: 30,
              imageID: model.avatar,
            ),
            const SizedBox(width: 8),
            Text(
              model.username ?? "",
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: 14,
                color: SystemHandler.theme.upsideSystem,
              ),
            ),
            const SizedBox(width: 8),
            RoleBuilder(accountRole: model.role),
          ],
        ),
      ),
    );
  }
}
