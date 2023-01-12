import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:flutter/material.dart';

class ImageNetwork {
  static Widget image(
    String? imageID, {
    required String imageBase,
    BorderRadiusGeometry? borderRadius,
    BoxFit? fit,
    double? width,
    double? height,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  }) {
    return Image.network(
      "${RepositoriesConfig.bImageURL}$imageBase/$imageID",
      fit: fit,
      errorBuilder: errorBuilder,
      scale: 1.0,
      width: width,
      height: height,
      gaplessPlayback: true,
      headers: ServerInterface.instance.header,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          child: child,
        );
      },
    );
  }
}
