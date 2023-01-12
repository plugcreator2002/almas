import 'package:almas/models/private/user_model.dart';

class AccountScoreModel {
  AccountScoreModel({
    this.id,
    this.accountId,
    this.score,
    this.createdAt,
    this.updatedAt,
    this.account,
  });

  AccountScoreModel.fromJson(dynamic json) {
    id = json['id'];
    accountId = json['account_id'];
    score = json['score'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['account'] != null) {
      account = UserModel.fromJson(json['account']);
    }
  }
  num? id;
  num? accountId;
  num? score;
  String? createdAt;
  String? updatedAt;
  UserModel? account;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['account_id'] = accountId;
    map['score'] = score;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (account != null) {
      map['account'] = account?.toJson();
    }
    return map;
  }
}
