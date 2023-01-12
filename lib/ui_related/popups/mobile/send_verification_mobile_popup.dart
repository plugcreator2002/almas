import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/requests/auth/auth.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:flutter/material.dart';

class SendVerificationMobilePopup extends StatelessWidget {
  const SendVerificationMobilePopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 150,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "your-account-is-not-verified".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  fontSize: 20,
                  color: SystemHandler.theme.upsideSystem,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: MainButtonMobile(
                      label: "send-verification-link".tr,
                      onTap: () {
                        AuthService.submitVerification((result) {
                          Navigator.pop(context, result);
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: MainButtonMobile(
                      label: "close".tr,
                      onTap: () => Navigator.pop(context, true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
