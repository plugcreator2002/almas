import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart'
    show StatelessWidget, Center, Key, SizedBox, CircularProgressIndicator;

class LoadingItemsBuilderUi extends StatelessWidget {
  const LoadingItemsBuilderUi({Key? key}) : super(key: key);

  @override
  build(context) {
    return Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: SystemHandler.theme.primary,
        ),
      ),
    );
  }
}
