import 'dart:async';

import 'package:almas/controllers/public/pagination_controller.dart';
import 'package:almas/models/public/pagination_related/pagination_model.dart';
import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
import 'package:flutter/material.dart' show ScrollController;

mixin ItemsBuilderHandler {
  bool extended = false;
  bool senderGoTopPage = false;
  final senderTopPageStream = StreamController<bool>();

  void changeSenderTopPage(bool data) {
    senderGoTopPage = data;
    senderTopPageStream.sink.add(data);
  }

  void onEndReached({
    PaginationResponse? pagination,
    required ScrollController controller,
    required void Function(PaginationParameters parameters)? callListener,
  }) {
    if (pagination != null) {
      if (controller.position.pixels >= 1500) {
        if (!senderGoTopPage) {
          changeSenderTopPage(true);
        }
      } else {
        if (senderGoTopPage) {
          changeSenderTopPage(false);
        }
      }
      // 6000
      if (controller.position.extentAfter <= 0 && !extended) {
        if (PaginationController.couldPaginate(pagination)) {
          final parameters = PaginationController.pagination(
            pagination,
          );
          if (callListener != null) {
            callListener(parameters);
          }
        }
        extended = true;
      } else if (extended && controller.position.extentAfter > 0) {
        extended = false;
      }
    }
  }
}
