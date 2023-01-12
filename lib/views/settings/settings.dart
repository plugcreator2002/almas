import 'package:almas/providers/index.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/settings/views/mobile/settings_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({
    Key? key,
  }) : super(key: key);

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsPresenter>().init();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: SettingsMobile(),
      ),
    );
  }
}
