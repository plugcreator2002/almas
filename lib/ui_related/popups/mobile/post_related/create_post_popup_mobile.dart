import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/private/posts/filtered_posts_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/inputs/input_area.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class CreatePostPopupMobile extends StatefulWidget {
  const CreatePostPopupMobile({Key? key}) : super(key: key);

  @override
  SafeState<CreatePostPopupMobile> createState() {
    return _CreatePostPopupMobileState();
  }
}

class _CreatePostPopupMobileState extends SafeState<CreatePostPopupMobile> {
  String content = "";

  @override
  build(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: SystemHandler.theme.system,
      child: Column(
        children: [
          InputArea(
            name: "text",
            hintText: "post-text".tr,
            maxLines: 18,
            minLines: 18,
            onChanged: (content) => this.content = content,
          ),
          const SizedBox(height: 15),
          MainButtonMobile(
            height: 50,
            validate: () => content.isNotEmpty,
            loadingKey: LoadingKeys.createPost,
            label: "send".tr,
            onTap: () {
              FilteredPostsController.instance.create(
                content,
                () => Navigator.pop(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
