import 'package:almas/config/constants/listening_keys.dart';
import 'package:almas/controllers/private/follows_controller.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/followers/views/mobile/followers_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainFollowers extends StatefulWidget {
  final num? userID;

  const MainFollowers({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  SafeState<MainFollowers> createState() => _MainFollowersState();
}

class _MainFollowersState extends SafeState<MainFollowers> {
  final presenter = FollowsPresenter();

  @override
  void initState() {
    super.initState();
    presenter.addListener(
      ListeningKeys.followersScreen,
      () => setState(() {}),
    );

    presenter.getFollowers(widget.userID);
  }

  @override
  build(context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: FollowersMobile(
          userID: widget.userID,
          presenter: presenter,
        ),
      ),
    );
  }
}
