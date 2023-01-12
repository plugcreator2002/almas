import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/routes/const.dart';
import 'package:almas/controllers/private/follows_controller.dart';
import 'package:almas/controllers/public/router_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/ui_related/builders/mini_loading_builder.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:almas/ui_related/caches_images.dart';
import 'package:almas/utils/list_related.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class LoversFlagMobile extends StatefulWidget {
  final UserModel? user;
  final String label;

  const LoversFlagMobile({
    Key? key,
    required this.label,
    required this.user,
  }) : super(key: key);

  @override
  SafeState<LoversFlagMobile> createState() => _LoversFlagMobileState();
}

class _LoversFlagMobileState extends SafeState<LoversFlagMobile> {
  List<UserModel> items = [];

  @override
  void initState() {
    super.initState();
    final presenter = FollowsPresenter();
    presenter.getTop3Followers(
      widget.user?.id,
      (items) {
        setState(() {
          this.items = items.safeSublist(0, 3);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteTags.lovers,
          arguments: widget.user?.id,
        );
      },
      child: SizedBox(
        height: 69,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontFamily: SystemHandler.family,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: SystemHandler.theme.info,
                  ),
                ),
              ),
              Row(
                children: [
                  MiniLoadingBuilder(
                    loadingKey:
                        "${LoadingKeys.top3Followers}${widget.user?.id}",
                    child: Row(
                      children: items.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FadingButton(
                            onPressEnd: () {
                              RouterController.pushProfile(context, e.id);
                            },
                            child: CachesImages(
                              avatarRadius: 25,
                              avatarSize: 33,
                              imageID: e.avatar,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: SystemHandler.theme.upsideSystem,
                    size: 20,
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
