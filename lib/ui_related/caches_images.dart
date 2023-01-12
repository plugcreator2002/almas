import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/utils/image_network.dart';
import 'package:flutter/material.dart';

class CachesImages extends StatelessWidget {
  final String? imageID;
  final String? imageBase;
  final double avatarRadius;
  final double avatarSize;
  final int? quality;
  final BorderRadiusGeometry? borderRadius;
  final IconData? avatarIcon;

  const CachesImages({
    Key? key,
    required this.imageID,
    this.avatarRadius = 25,
    this.avatarSize = 44,
    this.quality,
    this.borderRadius,
    this.avatarIcon,
    this.imageBase,
  }) : super(key: key);

  Widget ifNullable(ThemeData theme) {
    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: SystemHandler.theme.upsideSystem,
      child: Center(
        child: Icon(
          avatarIcon ?? Icons.person_outline_rounded,
          size: avatarSize,
          color: SystemHandler.theme.system,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (imageID == null || imageID?.isEmpty == true) {
      return ifNullable(theme);
    }
    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: SystemHandler.theme.upsideSystem,
      child: ImageNetwork.image(
        imageID,
        imageBase: imageBase ?? RepositoriesConfig.avatarsImage,
        borderRadius: borderRadius,
        errorBuilder: (context, object, stackTrace) {
          return ifNullable(theme);
        },
      ),
    );
  }
}
