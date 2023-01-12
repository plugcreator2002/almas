import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:almas/utils/image_network.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/utils/operations_related/handle_nullable.dart';

// ignore: must_be_immutable
class UserHeaderMobile extends StatelessWidget {
  late UserModel model;
  final IconData? avatarIcon;
  final VoidCallback? onTapPicture;
  final VoidCallback? onTapCover;

  UserHeaderMobile({
    Key? key,
    this.avatarIcon,
    this.onTapPicture,
    this.onTapCover,
    required UserModel? model,
  }) : super(key: key) {
    this.model = model ?? UserModel();
  }

  Widget? _headerImage(BuildContext context) {
    if (model.background.isNotNull && model.background?.isNotEmpty == true) {
      return ImageNetwork.image(
        model.background,
        imageBase: RepositoriesConfig.backgroundsImage,
        borderRadius: BorderRadius.zero,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, object, stackTrace) {
          return _headerChild ?? const SizedBox();
        },
      );
    }
    return null;
  }

  Widget? get _headerChild {
    if (model.background.isNull || model.background?.isEmpty == true) {
      return Center(
        child: Icon(
          avatarIcon ?? Icons.person_outline_rounded,
          color: SystemHandler.theme.system,
          size: 38,
        ),
      );
    }
    return null;
  }

  List<Widget> get _bio {
    if (model.bio == null || model.bio?.isEmpty == true) {
      return [];
    }
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          model.bio ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.1,
            fontFamily: SystemHandler.family,
            fontSize: 15,
            color: SystemHandler.theme.upsideSystem,
          ),
        ),
      ),
      const SizedBox(height: 20),
    ];
  }

  @override
  build(context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: onTapCover,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                color: SystemHandler.theme.info,
                child: _headerImage(context) ?? _headerChild,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -30,
              child: GestureDetector(
                onTap: onTapPicture,
                child: CachesImages(
                  avatarRadius: 40,
                  avatarSize: 35,
                  imageID: model.avatar,
                  avatarIcon: avatarIcon,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        ..._bio,
      ],
    );
  }
}
