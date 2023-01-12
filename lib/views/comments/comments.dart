import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/providers/private/comments_presenter.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/comments/views/mobile/comments_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainComments extends StatefulWidget {
  final PostModel? model;

  const MainComments({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  SafeState<MainComments> createState() => _MainCommentsState();
}

class _MainCommentsState extends SafeState<MainComments> {
  final presenter = CommentsPresenter();

  @override
  void initState() {
    super.initState();
    presenter.init(
      widget.model,
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseWidgets(
        mobile: CommentsMobile(
          presenter: presenter,
        ),
      ),
    );
  }
}
