import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/builders/refresh_page.dart';
import 'package:almas/ui_related/builders/role_builder.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/flags/mobile/profile_related/blocks_flag_mobile.dart';
import 'package:almas/ui_related/flags/mobile/profile_related/friends_flag_mobile.dart';
import 'package:almas/ui_related/flags/mobile/profile_related/lovers_flag_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/views/profile/widgets/mobile/option_counts_mobile.dart';
import 'package:almas/views/profile/widgets/mobile/user_header_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<AccountPresenter>(context);

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          flag: RoleBuilder(accountRole: presenter.profile.role),
          title: presenter.profile.username ?? 'guest-user'.tr,
        ),
      ),
      body: RefreshPage(
        onRefresh: () {
          presenter.getProfile(update: true);
        },
        child: ListView(
          children: [
            UserHeaderMobile(
              model: presenter.profile,
              avatarIcon: Icons.camera_alt_rounded,
              onTapPicture: () => presenter.uploadAvatar(),
              onTapCover: () => presenter.uploadBackground(),
            ),
            Center(
              child: MainButtonMobile(
                height: 38,
                width: 125,
                mainAxisSize: MainAxisSize.min,
                bgColor: SystemHandler.theme.info,
                label: "edit-profile".tr,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteTags.editProfile,
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionCountsMobile(
                  label: 'posts'.tr,
                  count: presenter.postsCount,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteTags.userPosts,
                      arguments: presenter.profile,
                    );
                  },
                ),
                OptionCountsMobile(
                  label: "followings".tr,
                  count: presenter.followersCount,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteTags.followers,
                      arguments: presenter.profile.id,
                    );
                  },
                ),
                OptionCountsMobile(
                  label: "followers".tr,
                  count: presenter.followingsCount,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteTags.followings,
                      arguments: presenter.profile.id,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            LoversFlagMobile(
              user: presenter.profile,
              label: "lovers".tr,
            ),
            const SizedBox(height: 8),
            FriendsFlagMobile(
              user: presenter.profile,
              label: "friends".tr,
            ),
            const SizedBox(height: 8),
            BlocksFlagMobile(
              userID: RepositoriesHandler.userData?.id,
              user: presenter.profile,
              label: "blocks".tr,
            ),
          ],
        ),
      ),
    );
  }
}
