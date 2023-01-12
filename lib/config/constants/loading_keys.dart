import 'package:almas/models/public/enums.dart';

class LoadingKeys {
  static const login = "login";
  static const register = "register";
  static const forgotPassword = "forgot-password";
  static const submitVerification = "submit-verification";

  static const uploadingAvatar = "uploading-avatar";
  static const uploadingBackground = "uploading-avatar";

  static const themes = "themes";
  static const fonts = "fonts";

  static final popularPosts = PostsType.popular.name;
  static final rooboorsPosts = PostsType.trends.name;
  static final chosenPosts = PostsType.chosen.name;
  static final explorePosts = PostsType.explore.name;
  static final timelinePosts = PostsType.timeline.name;
  static const createPost = "create-post";
  static const updatePost = "update-post";

  static const follows = "follows";
  static const blockedUsers = "blocked-users";
  static const blockUser = "block-user";
  static const unBlockUser = "unblock-user";

  static const comments = "comments/";
  static const replays = "replays/";
  static const createComment = "create-comment";

  static const followers = "followers/";
  static const followings = "followings/";
  static const top3Followers = "top3-followers/";
  static const top3Followings = "top3-followings/";

  static const updateProfile = "update-profile";
  static const updatePassword = "update-profile";
  static const notifications = "notifications";

  static const userPosts = "user-posts/";
  static const userProfile = "user-profile/";

  static const accountTopScore = "accountTopScore";
  static const accountTopWeekly = "accountTopWeekly";
  static const accountTopMonthly = "accountTopMonthly";
  static const accountTopYearly = "accountTopYearly";
}
