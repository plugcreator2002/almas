import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/ui_related/buttons/main_button_mobile.dart';
import 'package:almas/ui_related/custom_title.dart';
import 'package:almas/ui_related/header/header_option.dart';
import 'package:almas/ui_related/header/mobile/header.dart';
import 'package:almas/ui_related/inputs/input_card.dart';
import 'package:almas/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
import 'package:provider/provider.dart';
import 'package:psr_base/plugin_emulators/forms_builder/utils/form_builder_validators.dart';
import 'package:psr_base/plugin_emulators/forms_builder/widgets/builders/form_builder.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';
import 'package:psr_base/utils/logger.dart';

class EditProfileMobile extends StatefulWidget {
  const EditProfileMobile({Key? key}) : super(key: key);

  @override
  SafeState<EditProfileMobile> createState() => _State();
}

class _State extends SafeState<EditProfileMobile> {
  final formKey = GlobalKey<FormBuilderState>();
  String username = "";
  String bio = "";

  @override
  void initState() {
    final presenter = Provider.of<AccountPresenter>(
      context,
      listen: false,
    );
    username = presenter.profile.username ?? "";
    bio = presenter.profile.bio ?? "";
    super.initState();
  }

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
          title: "edit-profile".tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              InputCard(
                name: "username",
                prefixIcon: Icons.email_outlined,
                data: username,
                hintText: "username".tr,
                validator: FormValidators.compose([
                  FormValidators.required(context),
                  CustomValidators.username(context),
                ]),
                onChanged: (content) {
                  username = content;
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              InputCard(
                name: "bio",
                data: bio,
                hintText: "bio".tr,
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                validator: FormValidators.maxLength(context, 50),
                prefixIcon: Icons.description_outlined,
                onChanged: (content) => bio = content,
              ),
              const SizedBox(height: 15),
              Center(
                child: MainButtonMobile(
                  bgColor: SystemHandler.theme.info,
                  label: "submit".tr,
                  loadingKey: LoadingKeys.updateProfile,
                  onTap: () {
                    if (formKey.currentState?.validate() == true) {
                      final form = <String, dynamic>{
                        "username": presenter.profile.username,
                        "bio": presenter.profile.bio,
                      };

                      if (bio != presenter.profile.bio) {
                        if (bio.isEmpty) {
                          form["bio"] = null;
                        } else {
                          form["bio"] = bio;
                        }
                      }
                      if (username != presenter.profile.username) {
                        form["username"] = username.toLowerCase();
                      }

                      logger(form);
                      presenter.updateProfile(
                        form: form,
                        callback: () => Navigator.pop(context),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 25),
              CustomTitle(
                title: "edit-password".tr,
                color: SystemHandler.theme.primary,
                onClick: () {
                  Navigator.pushNamed(
                    context,
                    RouteTags.editPassword,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
