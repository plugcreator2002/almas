import 'package:almas/config/main_config.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/config/routes/route_generator.dart';
import 'package:almas/providers/main.dart';
import 'package:almas/providers/public/main_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/service_plugins/cb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CBServicePlugin.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    await MainConfig.init();
    runApp(const GlobalProvider(
      child: MainApplication(),
    ));
  });
}

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  SafeState<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends SafeState<MainApplication> {
  final currentData = MainPresenter();

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: ChangeNotifierProvider(
        create: (context) => currentData,
        child: Consumer<MainPresenter>(
          builder: (context, provider, child) {
            return MaterialApp(
              scrollBehavior: const ScrollBehavior(),
              navigatorKey: RepositoriesHandler.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Almas',
              locale: provider.locale,
              initialRoute: RouteTags.splash,
              localizationsDelegates: MainConfig.localizationsDelegates,
              supportedLocales: MainConfig.supportedLocales,
              builder: MainConfig.builder,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
