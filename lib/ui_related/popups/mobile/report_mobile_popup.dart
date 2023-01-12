import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class ReportMobilePopup extends StatefulWidget {
  const ReportMobilePopup({
    Key? key,
  }) : super(key: key);

  @override
  SafeState<ReportMobilePopup> createState() => _State();
}

class _State extends SafeState<ReportMobilePopup> {
  String reason = "";

  @override
  build(context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 170,
          margin: const EdgeInsets.all(44),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: SystemHandler.theme.system,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.5,
              color: SystemHandler.theme.shadow,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputCard(
                name: "report",
                hintText: "report-reason".tr,
                prefixIcon: Icons.description_outlined,
                onChanged: (content) {
                  reason = content;
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MainButtonMobile(
                  label: "submit-report".tr,
                  bgColor: SystemHandler.theme.info,
                  labelColor: SystemHandler.theme.system,
                  onTap: () {
                    Navigator.pop(context, reason);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
