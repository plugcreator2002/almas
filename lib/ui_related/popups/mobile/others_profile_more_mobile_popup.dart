import 'package:almas/controllers/private/others_profile_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/private/others_profile_presenter.dart';
import 'package:almas/ui_related/minors/row_option.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class OthersProfileMoreMobilePopup extends StatefulWidget {
  final OthersProfileController controller;

  const OthersProfileMoreMobilePopup({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  SafeState<OthersProfileMoreMobilePopup> createState() => _State();
}

class _State extends SafeState<OthersProfileMoreMobilePopup> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(popupListening, () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: SystemHandler.theme.system,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.controller.accessBanUser) ...[
            RowOption(
              label: widget.controller.nameStatusBan,
              onTap: widget.controller.bans,
            ),
          ],
          if (widget.controller.accessChangeRole) ...[
            RowOption(
              label: widget.controller.nameChangingRole,
              onTap: widget.controller.changeRole,
            ),
          ],
          RowOption(
            label: widget.controller.blocksStatus,
            onTap: widget.controller.blocks,
          ),
        ],
      ),
    );
  }
}
