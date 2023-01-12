import 'package:almas/controllers/public/router_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/ui_related/builders/role_builder.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:almas/ui_related/minors/row_option.dart';
import 'package:flutter/material.dart';

class PostHeaderToolsMobile extends StatelessWidget {
  final VoidCallback onTapMore;
  final UserModel? account;
  final bool accessMoreOptions;

  const PostHeaderToolsMobile({
    Key? key,
    required this.account,
    required this.onTapMore,
    this.accessMoreOptions = true,
  }) : super(key: key);

  @override
  build(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadingButton(
                onPressEnd: () {
                  RouterController.pushProfile(
                    context,
                    account?.id,
                  );
                },
                child: CachesImages(
                  avatarRadius: 30,
                  imageBase: RepositoriesConfig.avatarsImage,
                  imageID: account?.avatar,
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      account?.username ?? "",
                      style: TextStyle(
                        fontFamily: SystemHandler.family,
                        fontSize: 14,
                        color: SystemHandler.theme.upsideSystem,
                      ),
                    ),
                    const SizedBox(),
                    RoleBuilder(accountRole: account?.role),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (accessMoreOptions) ...[
          RowOption(
            icon: Icons.more_vert_rounded,
            onTap: onTapMore,
          )
        ] else ...[
          const SizedBox(),
        ],
      ],
    );
  }
}
