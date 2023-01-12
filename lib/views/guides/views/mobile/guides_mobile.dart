import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/minors/guide.dart';
import 'package:flutter/material.dart';

class GuidesMobile extends StatelessWidget {
  const GuidesMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(title: "guide".tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        controller: ScrollController(),
        children: [
          Guide(
            label: "guide-01-title".tr,
            description: "guide-01".tr,
          ),
          Guide(
            label: "guide-02-title".tr,
            description: "guide-02".tr,
          ),
          Guide(
            label: "guide-03-title".tr,
            description: "guide-03".tr,
          ),
          Guide(
            label: "guide-04-title".tr,
            description: "guide-04".tr,
          ),
          Guide(
            label: "guide-05-title".tr,
            description: "guide-05".tr,
          ),
          Guide(
            label: "guide-06-title".tr,
            description: "guide-06".tr,
          ),
          Guide(
            label: "guide-07-title".tr,
            description: "guide-07".tr,
          ),
          Guide(
            description: "guide-08".tr,
          ),
          Guide(
            description: "guide-09".tr,
          ),
          Guide(
            label: "guide-10-title".tr,
            description: "guide-10".tr,
          ),
          Guide(
            label: "guide-11-title".tr,
            description: "guide-11".tr,
          ),
          Guide(
            label: "guide-12-title".tr,
            description: "guide-12".tr,
          ),
          Guide(
            label: "guide-13-title".tr,
            description: "guide-13".tr,
          ),
          Guide(
            label: "guide-14-title".tr,
            description: "guide-14".tr,
          ),
          Guide(
            label: "guide-15-title".tr,
            description: "guide-15".tr,
          ),
          Guide(
            label: "guide-16-title".tr,
            description: "guide-16".tr,
          ),
          Guide(
            label: "guide-17-title".tr,
            description: "guide-17".tr,
          ),
          Guide(
            description: "guide-18".tr,
          ),
        ],
      ),
    );
  }
}
