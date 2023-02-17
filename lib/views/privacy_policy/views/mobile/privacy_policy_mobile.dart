import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/minors/guide.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyMobile extends StatelessWidget {
  const PrivacyPolicyMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(title: "privacy-policy".tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        controller: ScrollController(),
        children: [
          Guide(
            description: "privacy-policy-01".tr,
          ),
          Guide(
            description: "privacy-policy-02".tr,
          ),
          Guide(
            description: "privacy-policy-03".tr,
          ),
          Guide(
            description: "privacy-policy-04".tr,
          ),
          Guide(
            description: "privacy-policy-05".tr,
          ),
          Guide(
            description: "privacy-policy-06".tr,
          ),
          Guide(
            description: "privacy-policy-07".tr,
          ),
          Guide(
            description: "privacy-policy-08".tr,
          ),
          Guide(
            description: "privacy-policy-09".tr,
          ),
          Guide(
            description: "privacy-policy-10".tr,
          ),
          Guide(
            description: "privacy-policy-11".tr,
          ),
          Guide(
            description: "privacy-policy-12".tr,
          ),
          Guide(
            description: "privacy-policy-13".tr,
          ),
        ],
      ),
    );
  }
}
