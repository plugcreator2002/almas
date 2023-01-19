import 'package:almas/controllers/private/others_profile_controller.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/others_profile/views/mobile/others_profile_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainOthersProfile extends StatefulWidget {
  final num userID;

  const MainOthersProfile({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  SafeState<MainOthersProfile> createState() => _MainOthersProfileState();
}

class _MainOthersProfileState extends SafeState<MainOthersProfile> {
  final controller = OthersProfileController();

  @override
  void initState() {
    super.initState();
    controller.init(
      widget.userID,
      listener: () => setState(() {}),
    );
  }

  @override
  build(context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: OthersProfileMobile(
          userID: widget.userID,
          controller: controller,
        ),
      ),
    );
  }
}
