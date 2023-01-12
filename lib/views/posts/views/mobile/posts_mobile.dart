import 'package:almas/controllers/private/posts/filtered_posts_controller.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/public/enums.dart' show PostsType;
import 'package:almas/providers/private/filtered_posts_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/views/posts/widgets/mobile/post_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsMobile extends StatelessWidget {
  final PostsType type;

  const PostsMobile({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  build(context) {
    final presenter = Provider.of<FilteredPostsPresenter>(context);

    return BackgroundBuilder(
      child: ItemsBuilder<PostModel>(
        morePaging: true,
        loading: type.name,
        isEmpty: presenter.response.data?.isEmpty,
        pagination: presenter.response,
        items: presenter.response.data ?? [],
        onRefresh: (pagination) {
          FilteredPostsController.instance.get(type, pagination);
        },
        endReached: (pagination) {
          FilteredPostsController.instance.get(type, pagination);
        },
        itemBuilder: (context, index) {
          final element = (presenter.response.data ?? [])[index];

          return PostCardMobile(
            model: element,
            controller: FilteredPostsController.instance,
          );
        },
      ),
    );
  }
}
