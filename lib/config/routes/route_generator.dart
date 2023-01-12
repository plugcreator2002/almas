import 'package:almas/config/routes/const.dart';
import 'package:almas/config/routes/routes.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/views/blocks/blocks.dart';
import 'package:almas/views/index.dart';
import 'package:flutter/material.dart' show Route, RouteSettings, SizedBox;

String inRoute = RouteTags.splash;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    if (settings.name != null) {
      inRoute = settings.name ?? RouteTags.splash;
    }

    return Routes.fadeThrough(settings, (context) {
      switch (settings.name) {
        case RouteTags.splash:
          return const MainSplash();
        case RouteTags.login:
          return const MainLogin();
        case RouteTags.signup:
          return const MainSignUp();
        case RouteTags.forgetPassword:
          return const MainForgetPassword();
        case RouteTags.home:
          return const MainHome();
        case RouteTags.searchPosts:
          return const MainSearchUsers();
        case RouteTags.profile:
          return const MainProfile();
        case RouteTags.userProfile:
          return MainOthersProfile(userID: arguments as num);
        case RouteTags.settings:
          return const MainSettings();
        case RouteTags.topUsers:
          return const MainTopUsers();
        case RouteTags.comments:
          return MainComments(model: arguments as PostModel?);
        case RouteTags.followers:
          return MainFollowers(userID: arguments as num?);
        case RouteTags.followings:
          return MainFollowings(userID: arguments as num?);
        case RouteTags.lovers:
          return MainLovers(userID: arguments as num?);
        case RouteTags.friends:
          return MainFriends(userID: arguments as num?);
        case RouteTags.blocks:
          return MainBlocks(user: arguments as UserModel?);
        case RouteTags.editProfile:
          return const MainEditProfile();
        case RouteTags.editPassword:
          return const MainEditPassword();
        case RouteTags.notifications:
          return const MainNotifications();
        case RouteTags.userPosts:
          return MainPrivatePosts(model: arguments as UserModel?);
        case RouteTags.rules:
          return const MainRules();
        case RouteTags.guides:
          return const MainGuides();
        default:
          return const SizedBox();
      }
    });
  }
}
