import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/public/tick_option_model.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';

class TickOptionCardMobile extends StatelessWidget {
  final String? id;
  final TickOptionModel model;
  final void Function(String id) onSelected;

  const TickOptionCardMobile({
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
                onSelected(model.id);
              },
              child: Row(
                children: [
                  _iconRadio,
                  const SizedBox(width: 8),
                  Text(
                    model.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: SystemHandler.theme.upsideSystem,
                      fontFamily: SystemHandler.family,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    model.tick,
                    width: 33,
                    height: 33,
                  ),
                ],
              ),
            ),
          ),
          // MainButtonMobile(
          //   height: 35,
          //   label: 'online-payment'.tr,
          //   bgColor: SystemHandler.theme.info,
          // ),
        ],
      ),
    );
  }
}
