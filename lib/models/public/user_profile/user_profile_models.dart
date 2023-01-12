// import 'dart:async';
//
// import 'package:almas/models/private/user_model.dart';
//
// class UserProfileModels {
//   UserProfileModels({
//     this.user,
//     this.postsCount = 0,
//     this.followingsCount = 0,
//     this.followersCount = 0,
//     this.isFollowing = false,
//     this.isFollower = false,
//     this.isBlocking = false,
//   });
//
//   UserModel? user;
//   num postsCount = 0;
//   num followingsCount = 0;
//   num followersCount = 0;
//   bool isFollowing = false;
//   bool isFollower = false;
//   bool isBlocking = false;
//
//   final streamOptions = StreamController<bool>();
//
//    void copyWith({
//     UserModel? user,
//     num? postsCount,
//     num? followingsCount,
//     num? followersCount,
//     bool? isFollowing,
//     bool? isFollower,
//     bool? isBlocking,
//   }) {
//     return UserProfileModels(
//       user: user??
//     );
//   }
//
//   void setUserData(UserModel value) {
//     user = value;
//     streamUser.add(value);
//   }
//
//   void follow() {
//     isFollowing = true;
//     followersCount++;
//     streamIsFollowing.add(isFollowing);
//     streamFollowersCount.add(followersCount);
//   }
//
//   void unFollow() {
//     isFollowing = false;
//     followersCount--;
//     streamIsFollowing.add(isFollowing);
//     streamFollowersCount.add(followersCount);
//   }
//
//   void block() {
//     isBlocking = true;
//     isFollowing = false;
//     streamIsBlocking.add(isBlocking);
//     streamIsFollowing.add(isBlocking);
//   }
//
//   void unBlock() {
//     isBlocking = false;
//     streamIsBlocking.add(isBlocking);
//   }
//
//   void setCounts({
//     required num posts,
//     required num followers,
//     required num followings,
//   }) {
//     postsCount = posts;
//     streamPostsCount.add(posts);
//
//     followersCount = followers;
//     streamFollowersCount.add(followers);
//
//     followingsCount = followings;
//     streamFollowingsCount.add(followings);
//   }
//
//   void setIsFollowsRelated({
//     required bool isFollowing,
//     required bool isFollower,
//   }) {
//     this.isFollowing = isFollowing;
//     streamIsFollowing.add(isFollowing);
//
//     this.isFollower = isFollower;
//     streamIsFollower.add(isFollower);
//   }
//
//   void setIsBlocking(bool value) {
//     isBlocking = value;
//     streamIsBlocking.add(value);
//   }
// }
