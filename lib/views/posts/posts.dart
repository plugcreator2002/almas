import 'package:almas/controllers/private/posts/filtered_posts_controller.dart';
import 'package:almas/models/public/enums.dart' show PostsType;
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/posts/views/mobile/posts_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainPosts extends StatefulWidget {
  final PostsType type;

  const MainPosts({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  SafeState<MainPosts> createState() => _MainPostsState();
}

class _MainPostsState extends SafeState<MainPosts> {
  @override
  void initState() {
    super.initState();
    FilteredPostsController.instance.get(widget.type);
  }

  @override
  build(context) {
    return BaseWidgets(
      mobile: PostsMobile(type: widget.type),
    );
  }
}
