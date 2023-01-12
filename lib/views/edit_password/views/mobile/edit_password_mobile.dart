import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:almas/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/plugin_emulators/forms_builder/utils/form_builder_validators.dart';
import 'package:psr_base/plugin_emulators/forms_builder/widgets/builders/form_builder.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class EditPasswordMobile extends StatefulWidget {
  const EditPasswordMobile({Key? key}) : super(key: key);

  @override
  SafeState<EditPasswordMobile> createState() => _State();
}

class _State extends SafeState<EditPasswordMobile> {
  final formKey = GlobalKey<FormBuilderState>();
  String currentPassword = "";
  String newPassword = "";
  String repeatPassword = "";

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<AccountPresenter>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: SystemHandler.theme.background,
      appBar: CustomHeaderMobile(
        options: HeaderOptions(
          title: "edit-password".tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              InputCard(
                name: "current-password",
                hintText: "${"current-password".tr} ( 8:32 )",
                prefixIcon: Icons.lock_outline,
                textInputAction: TextInputAction.next,
                isPassword: true,
                data: currentPassword,
                validator: FormValidators.compose([
                  FormValidators.required(context),
                  FormValidators.minLength(context, 8),
                  FormValidators.maxLength(context, 32),
                  CustomValidators.password(context),
                ]),
                onChanged: (content) {
                  currentPassword = content;
                },
              ),
              InputCard(
                name: "new-password",
                hintText: "${"new-password".tr} ( 8:32 )",
                prefixIcon: Icons.lock_outline,
                textInputAction: TextInputAction.next,
                isPassword: true,
                validator: FormValidators.compose([
                  FormValidators.required(context),
                  FormValidators.minLength(context, 8),
                  FormValidators.maxLength(context, 32),
                  CustomValidators.password(context),
                ]),
                onChanged: (content) {
                  newPassword = content;
                },
              ),
              InputCard(
                name: "repeat-password",
                hintText: "${"repeat-password".tr} ( 8:32 )",
                prefixIcon: Icons.lock_outline,
                textInputAction: TextInputAction.done,
                isPassword: true,
                validator: FormValidators.compose([
                  FormValidators.required(context),
                  FormValidators.minLength(context, 8),
                  FormValidators.maxLength(context, 32),
                  CustomValidators.password(context),
                  FormValidators.equal(context, newPassword),
                ]),
                onChanged: (content) {
                  repeatPassword = content;
                  setState(() {});
                },
              ),
              const SizedBox(height: 15),
              Center(
                child: MainButtonMobile(
                  bgColor: SystemHandler.theme.info,
                  label: "submit".tr,
                  loadingKey: LoadingKeys.updatePassword,
                  onTap: () {
                    if (formKey.currentState?.validate() == true) {
                      context.read<AccountPresenter>().updatePassword(
                        callback: () => Navigator.pop(context),
                        form: {
                          "currentPassword": currentPassword,
                          "newPassword": newPassword,
                          "newPasswordConfirm": repeatPassword,
                        },
                      );
                    }
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
