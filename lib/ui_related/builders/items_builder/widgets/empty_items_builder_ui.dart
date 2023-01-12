import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/widgets.dart'
    show Key, StatelessWidget, Center, Text, TextStyle;

class EmptyItemsBuilderUi extends StatelessWidget {
  const EmptyItemsBuilderUi({Key? key}) : super(key: key);

  @override
  build(context) {
    return Center(
      child: Text(
        "unfortunately-nothing-was-found".tr,
        style: TextStyle(
          fontFamily: SystemHandler.family,
          fontSize: 16,
          color: SystemHandler.theme.upsideSystem,
        ),
      ),
    );
  }
}
