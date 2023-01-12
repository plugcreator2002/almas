import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/private/posts/posts_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/inputs/input_area.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class EditPostPopupMobile extends StatefulWidget {
  final PostsController controller;
  final PostModel model;

  const EditPostPopupMobile({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  SafeState<EditPostPopupMobile> createState() {
    return _EditPostPopupMobileState();
  }
}

class _EditPostPopupMobileState extends SafeState<EditPostPopupMobile> {
  String content = "";

  @override
  void initState() {
    super.initState();
    content = widget.model.content ?? "";
  }

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
            data: content,
            onChanged: (content) => this.content = content,
          ),
          const SizedBox(height: 15),
          MainButtonMobile(
            height: 50,
            validate: () => content.isNotEmpty,
            loadingKey: LoadingKeys.updatePost,
            label: "submit".tr,
            onTap: () {
              widget.controller.update(
                widget.model.id,
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
