import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:flutter/material.dart';

class FontOptionCardMobile extends StatelessWidget {
  final num? id;
  final SettingProductModel model;
  final void Function(num id) onSelected;

  const FontOptionCardMobile({
    Key? key,
    required this.model,
    this.id,
    required this.onSelected,
  }) : super(key: key);

  Widget get _iconRadio {
    if (id == model.id) {
      return Icon(
        Icons.radio_button_checked_rounded,
        color: SystemHandler.theme.info,
        size: 22,
      );
    }
    return Icon(
      Icons.radio_button_off_rounded,
      color: SystemHandler.theme.upsideSystem,
      size: 22,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: FadingButton(
              onPressEnd: () {
                if (model.id != null && model.isFree) {
                  onSelected(model.id!);
                }
              },
              child: Row(
                children: [
                  _iconRadio,
                  const SizedBox(width: 8),
                  Text(
                    "almas-application".tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: model.name,
                      color: SystemHandler.theme.upsideSystem,
                      // fontFamily: model.family,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!model.isFree) ...[
            MainButtonMobile(
              height: 35,
              label: 'online-payment'.tr,
              bgColor: SystemHandler.theme.info,
            ),
          ],
        ],
      ),
    );
  }
}
