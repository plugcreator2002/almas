import 'package:almas/models/private/top_users/models/account_score_model.dart';
import 'package:almas/models/private/top_users/top_users_response.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder.dart';
import 'package:almas/views/top_users/widgets/mobile/top_user_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainTopUsersBodiesMobile extends StatefulWidget {
  final String? loadingKey;
  final TopUsersResponse response;
  final void Function([PaginationParameters? response]) requestFind;

  const MainTopUsersBodiesMobile({
    Key? key,
    required this.requestFind,
    required this.response,
    this.loadingKey,
  }) : super(key: key);

  @override
  SafeState<MainTopUsersBodiesMobile> createState() => _State();
}

class _State extends SafeState<MainTopUsersBodiesMobile> {
  @override
  void initState() {
    super.initState();
    widget.requestFind();
  }

  @override
  build(context) {
    return ItemsBuilder<AccountScoreModel>(
      loading: widget.loadingKey,
      isEmpty: (widget.response.data ?? []).isEmpty,
      pagination: widget.response,
      morePaging: true,
      onRefresh: (pagination) => widget.requestFind(pagination),
      endReached: (pagination) => widget.requestFind(pagination),
      items: widget.response.data ?? [],
      itemBuilder: (context, index) {
        final element = (widget.response.data ?? [])[index];
        return TopUserCardMobile(model: element);
      },
    );
  }
}
