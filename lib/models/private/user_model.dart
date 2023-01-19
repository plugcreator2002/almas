import 'package:almas/models/public/enums.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/utils/extensions/enum_extension.dart';

class UserModel {
  UserModel({
    this.id = -1,
    this.email,
    this.username,
    this.password,
    this.avatar,
    this.background,
    this.bio,
    this.macAddress,
    this.role,
    this.isActive,
    this.refreshToken,
    this.createdAt,
    this.updatedAt,
  });

  UserRole _role(String? role) {
    UserRole roleEnum;
    switch (role) {
      case "admin":
        roleEnum = UserRole.admin;
        break;
      case "supervisor":
        roleEnum = UserRole.supervisor;
        break;
      case "manager":
        roleEnum = UserRole.manager;
        break;
      case "red":
        roleEnum = UserRole.red;
        break;
      case "user":
        roleEnum = UserRole.user;
        break;
      default:
        roleEnum = UserRole.non;
    }

    return roleEnum;
  }

  bool get itsMe {
    return id == RepositoriesHandler.userData?.id;
  }

  bool get isAdmin {
    return role == UserRole.admin;
  }

  bool get isSupervisor {
    return role == UserRole.supervisor;
  }

  bool get isManager {
    return role == UserRole.manager;
  }

  bool get isUser {
    return role == UserRole.user;
  }

  bool get redTick {
    return role == UserRole.red;
  }

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    avatar = json['avatar'];
    background = json['background'];
    bio = json['bio'];
    macAddress = json['mac_address'];
    role = _role(json['role']);
    isActive = json['isActive'];
    refreshToken = json['refreshToken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  late num id;
  String? email;
  String? username;
  String? password;
  String? avatar;
  String? background;
  String? bio;
  String? macAddress;
  UserRole? role;
  bool? isActive;
  String? refreshToken;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['username'] = username;
    map['password'] = password;
    map['avatar'] = avatar;
    map['background'] = background;
    map['bio'] = bio;
    map['mac_address'] = macAddress;
    map['role'] = role.nameEnum;
    map['isActive'] = isActive;
    map['refreshToken'] = refreshToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
