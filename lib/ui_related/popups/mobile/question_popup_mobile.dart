import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:flutter/material.dart';

class QuestionPopupMobile extends StatelessWidget {
  final String question;

  const QuestionPopupMobile({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          question,
          style: TextStyle(
            fontFamily: SystemHandler.family,
            fontSize: 15,
            color: SystemHandler.theme.upsideSystem,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            MainButtonMobile(
              flex: 1,
              label: "yes".tr,
              bgColor: SystemHandler.theme.info,
              labelColor: SystemHandler.theme.system,
              onTap: () => Navigator.pop(context, true),
            ),
            const SizedBox(width: 10),
            MainButtonMobile(
              flex: 1,
              label: "no".tr,
              bgColor: SystemHandler.theme.system,
              borderColor: SystemHandler.theme.info,
              onTap: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ],
    );
  }
}
