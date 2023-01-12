import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/profile/views/mobile/profile_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  void initState() {
    super.initState();
    context.read<AccountPresenter>().getProfile(update: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: ProfileMobile(),
      ),
    );
  }
}
