import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/settings_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/views/settings/widgets/mobile/fonts/fonts_options_mobile.dart';
import 'package:almas/views/settings/widgets/mobile/themes/themes_options_mobile.dart';
import 'package:almas/views/settings/widgets/mobile/ticks/ticks_options_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsMobile extends StatelessWidget {
  const SettingsMobile({Key? key}) : super(key: key);

  @override
  build(context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: 'settings'.tr,
        ),
      ),
      body: BackgroundBuilder(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const [
                  TicksOptionsMobile(),
                  SizedBox(height: 15),
                  FontsOptionsMobile(),
                  SizedBox(height: 15),
                  ThemesOptionsMobile(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: MainButtonMobile(
                bgColor: SystemHandler.theme.info,
                labelColor: SystemHandler.theme.system,
                label: "submit".tr,
                onTap: () {
                  context.read<SettingsPresenter>().submit();
                  Navigator.pushReplacementNamed(context, RouteTags.splash);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
