import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/utils/image_network.dart';
import 'package:flutter/material.dart';

class BackgroundBuilder extends StatelessWidget {
  final Widget child;

  const BackgroundBuilder({Key? key, required this.child}) : super(key: key);

  @override
  build(context) {
    final conditions = [
      SystemHandler.theme.name.isNotEmpty,
      RepositoriesHandler.theme?.isBackground == true,
    ];
    if (conditions[0] && conditions[1]) {
      final width = MediaQuery.of(context).size.width;

      return Stack(
        alignment: Alignment.center,
        children: [
          ImageNetwork.image(
            "${SystemHandler.theme.name}.jpg",
            imageBase: RepositoriesConfig.themesImage,
            fit: BoxFit.fitWidth,
            width: width,
            borderRadius: BorderRadius.zero,
            errorBuilder: (context, object, stackTrace) {
              return const SizedBox();
            },
          ),
          child,
        ],
      );
    }
    return child;
  }
}
