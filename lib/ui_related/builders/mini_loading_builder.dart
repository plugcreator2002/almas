import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/public/loading_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiniLoadingBuilder extends StatelessWidget {
  final Widget child;
  final String loadingKey;

  const MiniLoadingBuilder({
    Key? key,
    required this.child,
    required this.loadingKey,
  }) : super(key: key);

  @override
  build(context) {
    final presenter = Provider.of<LoadingPresenter>(context);

    if (presenter.data[loadingKey] == true) {
      return SizedBox(
        width: 11,
        height: 11,
        child: CircularProgressIndicator(
          color: SystemHandler.theme.primary,
          strokeWidth: 2,
        ),
      );
    }
    return child;
  }
}
