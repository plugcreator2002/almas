import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/mine_images.dart';
import 'package:almas/requests/account/account.dart';
import 'package:almas/ui_related/animations/rotation_builder.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/index.dart';

class ForgetPasswordMobile extends StatefulWidget {
  const ForgetPasswordMobile({
    Key? key,
  }) : super(key: key);

  @override
  SafeState<ForgetPasswordMobile> createState() => _State();
}

class _State extends SafeState<ForgetPasswordMobile> {
  final formKey = GlobalKey<FormBuilderState>();
  String email = "";

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            RotationBuilder(
              child: Image.asset(
                MineImages.logo,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 30),
            InputCard(
              name: "email",
              hintText: "email".tr,
              prefixIcon: Icons.email_outlined,
              data: email,
              textInputAction: TextInputAction.next,
              validator: FormValidators.compose([
                FormValidators.required(context),
                FormValidators.email(context),
              ]),
              onChanged: (content) {
                email = content;
              },
            ),
            const SizedBox(height: 25),
            MainButtonMobile(
              borderRadius: BorderRadius.circular(18),
              label: "recovery".tr,
              loadingKey: LoadingKeys.forgotPassword,
              onTap: () {
                if (email.isNotEmpty) {
                  AccountService.forgotPassword(email);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
