import 'package:almas/models/public/enums.dart';

class RolePermissions {
  static bool isAdmin(UserRole? role) {
    return role == UserRole.admin;
  }

  static bool isSupervisor(UserRole? role) {
    return role == UserRole.supervisor;
  }

  static bool isManager(UserRole? role) {
    return role == UserRole.manager;
  }

  static bool isRed(UserRole? role) {
    return role == UserRole.red;
  }

  static bool isUser(UserRole? role) {
    return role == UserRole.user;
  }
}
