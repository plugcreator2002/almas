import 'package:almas/config/routes/const.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:flutter/material.dart';

class RouterController {
  static void pushProfile(
    BuildContext context,
    num? id,
  ) {
    if (id == null) return;
    String route = RouteTags.userProfile;
    if (id == RepositoriesHandler.userData?.id) {
      route = RouteTags.profile;
    }
    Navigator.pushNamed(context, route, arguments: id);
  }
}
