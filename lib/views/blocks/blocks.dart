import 'package:almas/models/private/user_model.dart';
import 'package:almas/providers/private/account_presenter.dart';
import 'package:almas/ui_related/auxiliary/responsive/base_screen.dart';
import 'package:almas/views/blocks/views/mobile/blocks_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class MainBlocks extends StatefulWidget {
  final UserModel? user;

  const MainBlocks({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  SafeState<MainBlocks> createState() => _MainBlocksState();
}

class _MainBlocksState extends SafeState<MainBlocks> {
  @override
  void initState() {
    super.initState();
    context.read<AccountPresenter>().getBlockedUsers();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: const BaseWidgets(
        mobile: BlocksMobile(),
      ),
    );
  }
}
