import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/mine_icons.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/others_profile_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/builders/private_page_loading_builder.dart';
import 'package:almas/ui_related/builders/refresh_page.dart';
import 'package:almas/ui_related/builders/role_builder.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/flags/mobile/profile_related/friends_flag_mobile.dart';
import 'package:almas/ui_related/flags/mobile/profile_related/lovers_flag_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/popups/mobile/others_profile_more_mobile_popup.dart';
import 'package:almas/views/profile/widgets/mobile/option_counts_mobile.dart';
import 'package:almas/views/profile/widgets/mobile/user_header_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/utils/popups/opening_popups.dart';

class OthersProfileMobile extends StatelessWidget {
  final num userID;
  final OthersProfileController controller;

  const OthersProfileMobile({
    Key? key,
    required this.controller,
    required this.userID,
  }) : super(key: key);

  OptionsPressed? moreOptions(BuildContext context) {
    if (controller.accessMenuOptions) {
      return OptionsPressed(
        icon: Icons.more_vert_rounded,
        onPressed: () {
          OpeningPopups.showBottomPopup(
            context,
            view: OthersProfileMoreMobilePopup(
              controller: controller,
            ),
          );
        },
      );
    }
    return null;
  }

  @override
  build(context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: controller.user?.username,
          flag: RoleBuilder(accountRole: controller.user?.role),
          actions: [
            moreOptions(context),
          ].whereType<OptionsPressed>().toList(),
        ),
      ),
      body: RefreshPage(
        onRefresh: () => controller.init(userID),
        child: PrivatePageLoadingBuilder(
          loading: controller.loading,
          child: ListView(
            children: [
              UserHeaderMobile(
                model: controller.user,
              ),
              Center(
                child: MainButtonMobile(
                  height: 38,
                  width: 140,
                  iconSize: 18,
                  icon: controller.isFollowing ? MineIcons.done : null,
                  mainAxisSize: MainAxisSize.min,
                  label: controller.followsStatus,
                  onTap: () {
                    if (controller.isBlocking) {
                      controller.unblock();
                    } else {
                      controller.follows();
                    }
                  },
                  bgColor: [
                    SystemHandler.theme.info,
                    SystemHandler.theme.textDisabled,
                  ][controller.isBlocking == true ? 1 : 0],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OptionCountsMobile(
                    label: 'posts'.tr,
                    count: controller.postsCount,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteTags.userPosts,
                        arguments: controller.user,
                      );
                    },
                  ),
                  OptionCountsMobile(
                    label: "followings".tr,
                    count: controller.followersCount,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteTags.followers,
                        arguments: controller.user?.id,
                      );
                    },
                  ),
                  OptionCountsMobile(
                    label: "followers".tr,
                    count: controller.followingsCount,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteTags.followings,
                        arguments: controller.user?.id,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              LoversFlagMobile(
                // key: UniqueKey(),
                user: controller.user,
                label: "lovers".tr,
              ),
              const SizedBox(height: 8),
              FriendsFlagMobile(
                // key: UniqueKey(),
                user: controller.user,
                label: "friends".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
