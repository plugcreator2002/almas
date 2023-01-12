import 'package:almas/controllers/private/follows_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/lovers/views/mobile/lovers_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainLovers extends StatefulWidget {
  final num? userID;

  const MainLovers({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  SafeState<MainLovers> createState() => _MainLoversState();
}

class _MainLoversState extends SafeState<MainLovers> {
  List<UserModel> items = [];

  @override
  void initState() {
    super.initState();
    FollowsPresenter().getTop3Followers(
      widget.userID,
      (items) => setState(() {
        this.items = items;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: LoversMobile(
          items: items,
          userID: widget.userID,
        ),
      ),
    );
  }
}
