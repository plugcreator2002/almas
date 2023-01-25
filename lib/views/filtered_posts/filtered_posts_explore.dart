import 'package:almas/controllers/private/posts/filtered_posts_controller.dart';
import 'package:almas/models/public/enums.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/filtered_posts/views/filtered_posts_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainFilteredPosts extends StatefulWidget {
  final PostsType type;

  const MainFilteredPosts({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<MainFilteredPosts> createState() => _MainFilteredPostsState();
}

class _MainFilteredPostsState extends SafeState<MainFilteredPosts> {
  @override
  void initState() {
    super.initState();
    FilteredPostsController.instance.get(widget.type);
  }

  @override
  build(context) {
    return BaseWidgets(
      mobile: FilteredPostsMobile(type: widget.type),
    );
  }
}
