import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/providers/private/settings_presenter.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/utils/image_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeOptionCardMobile extends StatelessWidget {
  final num? id;
  final SettingProductModel model;
  final void Function(num id) onSelected;

  const ThemeOptionCardMobile({
    Key? key,
    this.id,
    required this.model,
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
        vertical: 20,
        horizontal: 8,
      ),
      child: Column(
        children: [
          Row(
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
                        (model.name ?? "").tr,
                        style: TextStyle(
                          fontFamily: SystemHandler.family,
                          fontSize: 18,
                          color: SystemHandler.theme.upsideSystem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (model.nonFree) ...[
                MainButtonMobile(
                  height: 35,
                  label: 'online-payment'.tr,
                  bgColor: SystemHandler.theme.info,
                  onTap: () {
                    // context.read<SettingsPresenter>().payment(model);
                  },
                ),
              ],
            ],
          ),
          if (model.name != null && model.isBackground) ...[
            const SizedBox(height: 15),
            ImageNetwork.image(
              "${model.name}.jpg",
              imageBase: RepositoriesConfig.themesImage,
              borderRadius: BorderRadius.circular(5),
              errorBuilder: (context, object, stackTrace) {
                return const SizedBox();
              },
            ),
          ],
        ],
      ),
    );
  }
}
