import 'package:almas/config/constants/settings_constants.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/settings_presenter.dart';
import 'package:almas/views/settings/widgets/mobile/header_options_flag_mobile.dart';
import 'package:almas/views/settings/widgets/mobile/ticks/ticks_option_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicksOptionsMobile extends StatelessWidget {
  const TicksOptionsMobile({
    Key? key,
  }) : super(key: key);

  @override
  build(context) {
    final presenter = Provider.of<SettingsPresenter>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: SystemHandler.theme.system,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          HeaderOptionsFlagMobile(
            label: "payment-for-tick".tr,
            data: "1,000,000 ${"toman".tr}",
          ),
          const SizedBox(height: 20),
          ...SettingsConstants.ticks.map((element) {
            return TickOptionCardMobile(
              id: presenter.tickID,
              model: element,
              onSelected: (id) {
                presenter.changeTick(id);
              },
            );
          }),
        ],
      ),
    );
  }
}
