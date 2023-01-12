import 'package:almas/config/mine_colors.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  final String? label;
  final String? description;
  final String? url;

  const Guide({
    Key? key,
    this.label,
    this.description,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          if (label != null) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                label ?? "",
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  fontSize: 17,
                  color: SystemHandler.theme.info,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (description != null) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                description ?? "",
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  fontSize: 15,
                  color: SystemHandler.theme.upsideSystem,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (url != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: FadingButton(
                onPressEnd: () {
                  RepositoriesHandler.launchURL(Uri.parse(url ?? ""));
                },
                child: Text(
                  url ?? "",
                  style: TextStyle(
                    fontFamily: SystemHandler.family,
                    fontSize: 15,
                    color: MineColors.lightInfo,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
