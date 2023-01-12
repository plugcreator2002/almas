import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:almas/providers/public/loading_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/builders/items_builder/items_builder_handler.dart';
import 'package:almas/ui_related/builders/items_builder/widgets/empty_items_builder_ui.dart';
import 'package:almas/ui_related/builders/items_builder/widgets/go_top_page_items_builder_ui.dart';
import 'package:almas/ui_related/builders/items_builder/widgets/loading_items_builder_ui.dart';
import 'package:almas/ui_related/builders/refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class ItemsBuilder<T> extends StatefulWidget {
  final List<T> items;
  final PaginationResponse? pagination;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final String? loading;
  final bool? isEmpty;
  final bool morePaging;
  late final double? initialOffset;
  final bool reverse;
  final void Function(PaginationParameters pagination)? endReached;
  late final ScrollController _controller;
  final void Function(PaginationParameters? pagination)? onRefresh;

  ItemsBuilder({
    Key? key,
    required this.items,
    this.pagination,
    required this.itemBuilder,
    this.endReached,
    this.loading,
    this.isEmpty = false,
    this.morePaging = false,
    this.reverse = false,
    this.onRefresh,
    ScrollController? controller,
    double? initialOffset,
  }) : super(key: key) {
    if (controller != null) {
      _controller = controller;
    } else {
      _controller = ScrollController(
        initialScrollOffset: initialOffset ?? 0,
      );
    }
  }

  @override
  SafeState<ItemsBuilder> createState() {
    // ignore: no_logic_in_create_state
    return _State(controller: _controller);
  }
}

class _State extends SafeState<ItemsBuilder> with ItemsBuilderHandler {
  late ScrollController controller;
  bool loading = false;

  _State({required this.controller});

  void _scrollListener() {
    onEndReached(
      controller: controller,
      pagination: widget.pagination,
      callListener: widget.endReached,
    );
  }

  bool get isEmpty {
    return widget.isEmpty == null || widget.isEmpty == true;
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  // @override
  // void didUpdateWidget(covariant ItemsBuilder oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.isEmpty && controller.positions.isNotEmpty) {
  //     if (controller.position.extentBefore > 0) {
  //       controller.animateTo(
  //         0,
  //         duration: const Duration(seconds: 1),
  //         curve: Curves.easeOutQuart,
  //       );
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_scrollListener);
    controller.dispose();
  }

  bool get morePaging {
    if (isEmpty) return false;
    final page = widget.pagination;
    if (page == null) return false;
    if (page.limit < page.total && widget.morePaging) {
      return true;
    }
    return false;
  }

  Widget? get _isNon {
    if (widget.loading != null) {
      final presenter = Provider.of<LoadingPresenter>(context);
      if (presenter.data[widget.loading] == true) {
        return const LoadingItemsBuilderUi();
      }
    }
    if (isEmpty || RepositoriesHandler.authToken == null) {
      return const EmptyItemsBuilderUi();
    }
    return null;
  }

  Widget get _builder {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      controller: controller,
      reverse: widget.reverse,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: widget.itemBuilder,
    );
  }

  @override
  build(context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: RefreshPage(
            child: _isNon ?? _builder,
            onRefresh: () => (widget.onRefresh ?? (_) {})(null),
          ),
        ),
        StreamBuilder<bool>(
          stream: senderTopPageStream.stream,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return GoTopPageItemsBuilderUi(
                reverse: widget.reverse,
                onPressed: () {
                  controller.animateTo(
                    0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.bounceInOut,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
