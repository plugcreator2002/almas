import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/settings_presenter.dart';
import 'package:almas/ui_related/builders/mini_loading_builder.dart';
import 'package:almas/views/settings/widgets/mobile/header_options_flag_mobile.dart';
import 'package:almas/views/settings/widgets/mobile/themes/theme_option_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemesOptionsMobile extends StatelessWidget {
  const ThemesOptionsMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            label: "payment-for-any-theme".tr,
            data: "20,000 ${"toman".tr}",
          ),
          const SizedBox(height: 20),
          MiniLoadingBuilder(
            loadingKey: LoadingKeys.themes,
            child: Column(
              children: (presenter.themes.data ?? []).map((element) {
                return ThemeOptionCardMobile(
                  id: presenter.theme?.id,
                  model: element,
                  onSelected: (id) => presenter.changeTheme(element),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
