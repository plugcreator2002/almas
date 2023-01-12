import 'package:almas/controllers/private/posts/private_posts_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/private_posts/views/mobile/private_posts_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainPrivatePosts extends StatefulWidget {
  final UserModel? model;

  const MainPrivatePosts({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  SafeState<MainPrivatePosts> createState() => _MainPrivatePostsState();
}

class _MainPrivatePostsState extends SafeState<MainPrivatePosts> {
  @override
  void initState() {
    super.initState();
    PrivatePostsController.instance.get(widget.model?.id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: PrivatePostsMobile(
          model: widget.model,
        ),
      ),
    );
  }
}
