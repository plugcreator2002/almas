import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/search_users_presenter.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:almas/views/search_users/widgets/mobile/search_user_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUsersMobile extends StatelessWidget {
  const SearchUsersMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SearchUsersPresenter>(context);

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "search-users".tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: Column(
          children: [
            InputCard(
              name: "search-for-user",
              hintText: "search-for-user".tr,
              prefixIcon: Icons.search_rounded,
              onChanged: (content) {
                presenter.getSearchUsers(content: content);
              },
            ),
            Expanded(
              child: ListView(
                controller: ScrollController(),
                children: presenter.users.reversed.map((e) {
                  return SearchUserCardMobile(model: e);
                }).toList(),
                // children: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
