import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/posts/filtered_posts_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/controllers/public/tabs/tab_controller.dart';
import 'package:almas/controllers/public/tabs/tab_items.dart';
import 'package:almas/models/public/enums.dart';
import 'package:almas/repositories/permissions/loggedin_permissions.dart';
import 'package:almas/ui_related/builders/bg_builder.dart';
import 'package:almas/ui_related/buttons/floating_button.dart';
import 'package:almas/ui_related/drawer/drawer.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/popups/mobile/post_related/create_post_popup_mobile.dart';
import 'package:almas/ui_related/tab/mobile/custom_tab_mobile.dart';
import 'package:almas/views/filtered_posts/filtered_posts_explore.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/index.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  SafeState<HomeMobile> createState() => _State();
}

class _State extends SafeState<HomeMobile> with TickerProviderStateMixin {
  final scaffold = GlobalKey<ScaffoldState>();
  late final CustomTabController handler;

  @override
  void initState() {
    super.initState();
    handler = CustomTabController(
      tabs: TabItems.home,
      controller: TabController(
        length: TabItems.home.length,
        vsync: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: SystemHandler.theme.background,
      drawer: const MainDrawer(),
      appBar: CustomHeaderMobile(
        height: 110,
        bottom: CustomTabMobile(
          isScrollable: true,
          customTabHandler: handler,
        ),
        options: HeaderOptions(
          title: "gem".tr,
          leading: OptionsPressed(
            icon: Icons.menu_rounded,
            onPressed: () => scaffold.currentState?.openDrawer(),
          ),
          actions: [
            OptionsPressed(
              icon: Icons.search_rounded,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteTags.searchPosts,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingButtonMobile(
        onTap: () {
          LoggedInPermissions.checkHasToken(() {
            OpeningPopups.showBottomPopup(
              context,
              view: CreatePostPopupMobile(
                controller: FilteredPostsController.instance,
              ),
            );
          });
        },
      ),
      body: WillPopScope(
        onWillPop: () async {
          final output = await SystemHandler.exit(scaffold);
          return output;
        },
        child: BackgroundBuilder(
          child: TabBarView(
            controller: handler.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MainFilteredPosts(type: PostsType.timeline),
              MainFilteredPosts(type: PostsType.chosen),
              MainFilteredPosts(type: PostsType.popular),
              MainFilteredPosts(type: PostsType.trends),
              MainFilteredPosts(type: PostsType.explore),
            ],
          ),
        ),
      ),
    );
  }
}
