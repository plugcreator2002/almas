import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/mine_images.dart';
import 'package:almas/controllers/private/auth/signup_controller.dart';
import 'package:almas/ui_related/animations/rotation_builder.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:almas/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/index.dart';

class SignUpMobile extends StatefulWidget {
  const SignUpMobile({
    Key? key,
  }) : super(key: key);

  @override
  SafeState<SignUpMobile> createState() => _SignUpMobileState();
}

class _SignUpMobileState extends SafeState<SignUpMobile> {
  final controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.always,
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
              data: controller.email,
              textInputAction: TextInputAction.next,
              validator: FormValidators.compose([
                FormValidators.required(context),
                FormValidators.email(context),
              ]),
              onChanged: (content) {
                controller.email = content;
              },
            ),
            InputCard(
              name: "username",
              hintText: "username".tr,
              prefixIcon: Icons.person_outline_rounded,
              data: controller.username,
              textInputAction: TextInputAction.next,
              validator: CustomValidators.username(context),
              onChanged: (content) {
                controller.username = content;
              },
            ),
            InputCard(
              name: "password",
              hintText: "${"password".tr} ( 8:32 )",
              prefixIcon: Icons.lock_outline,
              data: controller.password,
              textInputAction: TextInputAction.next,
              isPassword: true,
              validator: FormValidators.compose([
                FormValidators.required(context),
                FormValidators.minLength(context, 8),
                FormValidators.maxLength(context, 32),
                CustomValidators.password(context),
              ]),
              onChanged: (content) {
                controller.password = content;
              },
            ),
            InputCard(
              name: "repeat-password",
              hintText: "${"repeat-password".tr} ( 8:32 )",
              prefixIcon: Icons.lock_outline,
              data: controller.repeatPassword,
              textInputAction: TextInputAction.done,
              isPassword: true,
              validator: FormValidators.compose([
                FormValidators.required(context),
                FormValidators.minLength(context, 8),
                FormValidators.maxLength(context, 32),
                FormValidators.equal(context, controller.password),
              ]),
              onChanged: (content) {
                controller.repeatPassword = content;
                setState(() {});
              },
            ),
            const SizedBox(height: 25),
            MainButtonMobile(
              label: "sign-up".tr,
              loadingKey: LoadingKeys.register,
              borderRadius: BorderRadius.circular(18),
              validate: () => controller.formKey.currentState?.validate(),
              onTap: () => controller.signup(context),
            ),
          ],
        ),
      ),
    );
  }
}
