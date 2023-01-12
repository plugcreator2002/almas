import 'package:almas/config/mine_images.dart';
import 'package:almas/models/public/enums.dart';
import 'package:almas/repositories/permissions/role_permissions.dart';
import 'package:flutter/material.dart';

class RoleBuilder extends StatelessWidget {
  final UserRole? accountRole;

  const RoleBuilder({
    Key? key,
    required this.accountRole,
  }) : super(key: key);

  @override
  build(context) {
    if (RolePermissions.isRed(accountRole)) {
      return Image.asset(
        MineImages.blueTick,
        width: 30,
        height: 30,
      );
    }
    return const SizedBox();
  }
}
