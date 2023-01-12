import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:almas/utils/image_network.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/utils/operations_related/handle_nullable.dart';

class DrawerHeaderMobile extends StatelessWidget {
  final String? name;
  final String? avatarImage;
  final String? coverImage;

  const DrawerHeaderMobile({
    Key? key,
    this.name,
    this.avatarImage,
    this.coverImage,
  }) : super(key: key);

  Widget? headerImage(BuildContext context) {
    if (coverImage.isNotNull && coverImage?.isNotEmpty == true) {
      return ImageNetwork.image(
        coverImage,
        imageBase: RepositoriesConfig.backgroundsImage,
        borderRadius: BorderRadius.zero,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, object, stackTrace) {
          return const SizedBox();
        },
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          color: SystemHandler.theme.info,
          child: headerImage(context) ?? const SizedBox(),
        ),
        UserAccountsDrawerHeader(
          accountEmail: const SizedBox(),
          accountName: Text(
            name ?? 'guest-user'.tr,
            style: TextStyle(
              fontFamily: SystemHandler.family,
              fontSize: 18,
              color: SystemHandler.theme.system,
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          currentAccountPicture: CachesImages(
            imageID: avatarImage,
          ),
        ),
      ],
    );
  }
}
