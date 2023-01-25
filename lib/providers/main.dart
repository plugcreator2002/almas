import 'package:almas/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => MainPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => LoadingPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => FilteredPostsPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => AccountPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => TopUsersPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => SearchUsersPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => NotificationsPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => NotificationsBadgePresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => SettingsPresenter(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => PrivatePostsPresenter(),
        ),
      ],
      child: child,
    );
  }
}
