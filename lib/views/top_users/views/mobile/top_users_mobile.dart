import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/controllers/public/tabs/tab_controller.dart';
import 'package:almas/controllers/public/tabs/tab_items.dart';
import 'package:almas/providers/private/top_users_presenter.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/tab/mobile/custom_tab_mobile.dart';
import 'package:almas/views/top_users/widgets/mobile/top_users_bodies_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class TopUsersMobile extends StatefulWidget {
  const TopUsersMobile({Key? key}) : super(key: key);

  @override
  SafeState<TopUsersMobile> createState() => _State();
}

class _State extends SafeState<TopUsersMobile> with TickerProviderStateMixin {
  late final CustomTabController handler;

  @override
  void initState() {
    super.initState();
    handler = CustomTabController(
      tabs: TabItems.topUsers,
      onTap: (index) {},
      controller: TabController(
        length: TabItems.topUsers.length,
        vsync: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<TopUsersPresenter>(context);

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        height: 110,
        bottom: CustomTabMobile(
          isScrollable: false,
          customTabHandler: handler,
        ),
        options: HeaderOptions(
          title: "top-users".tr,
        ),
      ),
      body: BackgroundBuilder(
        child: TabBarView(
          controller: handler.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            MainTopUsersBodiesMobile(
              loadingKey: LoadingKeys.accountTopWeekly,
              response: presenter.topScoreWeekly,
              requestFind: ([response]) {
                presenter.getAccountTopWeekly(response);
              },
            ),
            MainTopUsersBodiesMobile(
              loadingKey: LoadingKeys.accountTopMonthly,
              response: presenter.topScoreMonthly,
              requestFind: ([response]) {
                presenter.getAccountTopMonthly(response);
              },
            ),
            MainTopUsersBodiesMobile(
              loadingKey: LoadingKeys.accountTopYearly,
              response: presenter.topScoreYearly,
              requestFind: ([response]) {
                presenter.getAccountTopYearly(response);
              },
            ),
          ],
        ),
      ),
    );
  }
}
