import 'package:almas/config/constants/listening_keys.dart';
import 'package:almas/controllers/private/follows_controller.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/followings/views/mobile/followings_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainFollowings extends StatefulWidget {
  final num? userID;

  const MainFollowings({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  SafeState<MainFollowings> createState() => _MainFollowingsState();
}

class _MainFollowingsState extends SafeState<MainFollowings> {
  final presenter = FollowsPresenter();

  @override
  void initState() {
    super.initState();
    presenter.addListener(
      ListeningKeys.followingsScreen,
      () => setState(() {}),
    );

    presenter.getFollowings(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: FollowingsMobile(
          userID: widget.userID,
          presenter: presenter,
        ),
      ),
    );
  }
}
