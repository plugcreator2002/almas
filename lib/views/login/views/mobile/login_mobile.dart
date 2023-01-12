import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/mine_images.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/auth/login_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/animations/rotation_builder.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/custom_title.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/index.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({
    Key? key,
  }) : super(key: key);

  @override
  SafeState<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends SafeState<LoginMobile> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          controller: ScrollController(),
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
              data: controller.email,
              textInputAction: TextInputAction.next,
              onChanged: (content) => controller.email = content,
              validator: FormValidators.compose([
                FormValidators.required(context),
                FormValidators.email(context),
              ]),
            ),
            InputCard(
              name: "password",
              hintText: "${"password".tr} ( 8:32 )",
              prefixIcon: Icons.lock_outline,
              data: controller.password,
              textInputAction: TextInputAction.done,
              isPassword: true,
              validator: FormValidators.compose([
                FormValidators.required(context),
                FormValidators.minLength(context, 8),
                FormValidators.maxLength(context, 32),
              ]),
              onChanged: (content) {
                controller.password = content;
              },
            ),
            const SizedBox(height: 25),
            MainButtonMobile(
              label: "login".tr,
              loadingKey: LoadingKeys.login,
              borderRadius: BorderRadius.circular(18),
              onTap: () => controller.login(() {
                Navigator.pushReplacementNamed(
                  context,
                  RouteTags.splash,
                );
              }),
            ),
            const SizedBox(height: 25),
            CustomTitle(
              title: "sign-up".tr,
              color: SystemHandler.theme.primary,
              mainAxisAlignment: MainAxisAlignment.center,
              onClick: () {
                Navigator.pushNamed(
                  context,
                  RouteTags.signup,
                );
              },
            ),
            const SizedBox(height: 20),
            CustomTitle(
              title: "forget-password".tr,
              mainAxisAlignment: MainAxisAlignment.center,
              onClick: () {
                Navigator.pushNamed(
                  context,
                  RouteTags.forgetPassword,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
