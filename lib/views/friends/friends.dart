import 'package:almas/controllers/private/follows_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/friends/views/mobile/friends_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainFriends extends StatefulWidget {
  final num? userID;

  const MainFriends({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  SafeState<MainFriends> createState() => _MainFriendsState();
}

class _MainFriendsState extends SafeState<MainFriends> {
  List<UserModel> items = [];

  @override
  void initState() {
    super.initState();
    final presenter = FollowsPresenter();
    presenter.getTop3Followings(
      widget.userID,
      (items) => setState(() {
        this.items = items;
      }),
    );
  }

  @override
  build(context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: FriendsMobile(
          items: items,
          userID: widget.userID,
        ),
      ),
    );
  }
}
