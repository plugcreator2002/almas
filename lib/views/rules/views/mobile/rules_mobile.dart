import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/minors/guide.dart';
import 'package:flutter/material.dart';

class RulesMobile extends StatelessWidget {
  const RulesMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(title: "rules".tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        controller: ScrollController(),
        children: [
          Guide(
            label: "rules-01-title".tr,
            description: "rules-01".tr,
          ),
          Guide(
            description: "rules-02".tr,
          ),
          Guide(
            label: "rules-03-title".tr,
            description: "rules-03".tr,
          ),
          Guide(
            label: "rules-04-title".tr,
            description: "rules-04".tr,
          ),
          Guide(
            label: "rules-05-title".tr,
            description: "rules-05".tr,
          ),
          Guide(
            label: "rules-06-title".tr,
            description: "rules-06".tr,
          ),
          Guide(
            label: "rules-07-title".tr,
            description: "rules-07".tr,
          ),
          Guide(
            label: "rules-08-title".tr,
            description: "rules-08".tr,
          ),
          Guide(
            label: "rules-09-title".tr,
            description: "rules-09".tr,
          ),
          Guide(
            label: "rules-10-title".tr,
            description: "rules-10".tr,
          ),
          Guide(
            description: "rules-11".tr,
          ),
          Guide(
            description: "rules-12".tr,
          ),
          Guide(
            description: "rules-13".tr,
          ),
          Guide(
            description: "rules-14".tr,
          ),
          Guide(
            description: "rules-15".tr,
            url: "rules-15-url".tr,
          ),
          Guide(
            description: "rules-16".tr,
          ),
          Guide(
            description: "rules-17".tr,
          ),
          Guide(
            description: "rules-18".tr,
          ),
          Guide(
            description: "rules-19".tr,
          ),
          Guide(
            description: "rules-20".tr,
            url: "rules-20-url".tr,
          ),
          Guide(
            description: "rules-21".tr,
            url: "rules-21-url".tr,
          ),
        ],
      ),
    );
  }
}
