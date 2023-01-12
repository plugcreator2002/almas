// import 'package:almas/controllers/private/follows/follows_type_enum.dart';
// import 'package:almas/models/private/follows/accounts_response.dart';
// import 'package:almas/models/private/user_model.dart';
// import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
// import 'package:almas/providers/config/parent_provider.dart';
// import 'package:almas/requests/account/account.dart';
// import 'package:almas/requests/follows/follows.dart';
//
// class FollowsPresenter extends ParentProvider {
//   FollowsResponse followers = FollowsResponse();
//   FollowsResponse followings = FollowsResponse();
//
//   Future<void> get({
//     PaginationParameters? pagination,
//     required num? userID,
//     required String loadingKey,
//   }) async {
//     final response = await FollowsService.get(
//       userID: userID,
//       type: type,
//       pagination: pagination,
//       loadingKey: loadingKey,
//     );
//
//     if (response["data"] is List) {
//       final items = (response["data"] as List).map((e) {
//         return UserModel.fromJson(e);
//       }).toList();
//
//       final result = FollowsResponse.fromJson(
//         response,
//         items,
//         pagination?.page,
//       );
//
//       if (type == FollowsType.followers) {
//         followers = result;
//         notifyListeners();
//       } else if (type == FollowsType.followings) {
//         followings = result;
//         notifyListeners();
//       }
//     }
//   }
//
//   Future<void> top3Followers(
//     num? userID,
//     void Function(List<UserModel> items) callback,
//   ) async {
//     if (userID == null) return;
//     final result = await AccountService.top3Followers(userID);
//
//     if (result.isNotEmpty) {
//       final items = result.map((e) {
//         return UserModel.fromJson(e);
//       }).toList();
//
//       callback(items);
//     }
//   }
//
//   Future<void> top3Followings(
//     num? userID,
//     void Function(List<UserModel> items) callback,
//   ) async {
//     if (userID == null) return;
//     final result = await AccountService.top3Followings(userID);
//
//     if (result.isNotEmpty) {
//       final items = result.map((e) {
//         return UserModel.fromJson(e);
//       }).toList();
//
//       callback(items);
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     followers = FollowsResponse();
//     followings = FollowsResponse();
//   }
// }
