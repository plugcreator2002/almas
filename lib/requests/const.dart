import 'package:almas/repositories/repositories_config.dart';

class RoutesAPI {
  static const baseURL = RepositoriesConfig.baseURL;

  /// auth
  static const authLogin = '${baseURL}auth/login';
  static const authRegister = '${baseURL}auth/register';
  static const authRefresh = '${baseURL}auth/refresh';
  static const authLogout = '${baseURL}auth/logout';

  /// account
  static const accountFindAll = '${baseURL}account/find-all';
  static const accountMe = '${baseURL}account/me';
  static const accountBlocked = '${baseURL}account/find-all-blocked';
  static const accountFindOne = '${baseURL}account/by-id';
  static const accountUpdate = '${baseURL}account/update';
  static const accountUpdatePassword = '${baseURL}account/update-password';
  static const accountUploadAvatar = '${baseURL}account/avatar';
  static const accountUploadBackground = '${baseURL}account/background';
  static const accountBlock = '${baseURL}account/block';
  static const accountUnBlock = '${baseURL}account/unblock';
  static const accountISBlocked = '${baseURL}account/is-blocked';
  static const accountSearchByUsername = '${baseURL}account/search-by-username';
  static const accountBan = '${baseURL}account/banned';
  static const accountUnBan = '${baseURL}account/unbanned';
  static const accountChangeRole = '${baseURL}account/update-type';

  // account-password related
  static const accountPass = "account-password";
  static const accountForgotPassword = '$baseURL$accountPass/forgot-password';

  // account-follow related
  static const followBase = "account-follow";
  static const accountFollow = '$baseURL$followBase/follow';
  static const accountUnfollow = '$baseURL$followBase/unfollow';
  static const accountFollowings =
      '$baseURL$followBase/find-all-followings-by-account-id';
  static const accountFollowers =
      '$baseURL$followBase/find-all-followers-by-account-id';
  static const accountTop3Followers = '$baseURL$followBase/top-3-followers';
  static const accountTop3Followings = '$baseURL$followBase/top-3-followings';

  // account follow count
  static const followCountBase = "$baseURL$followBase/find-account";
  static const accountFollowingsCount = '$followCountBase-followings-count';
  static const accountFollowersCount = '$followCountBase-followers-count';

  static const accountISFollowing = '$baseURL$followBase/is-following';
  static const accountISFollower = '$baseURL$followBase/is-follower';
  static const accountISFollowingOrFollower =
      '$baseURL$followBase/is-following-or-follower';

  /// posts
  static const findPosts = '${baseURL}post/find-all';
  static const findPostById = '${baseURL}post/find-by-id';
  static const findPostsByUser = '${baseURL}post/find-all-posts-by-account-id';
  static const postCreate = '${baseURL}post/create';
  static const postUpdate = '${baseURL}post/update';
  static const postDelete = '${baseURL}post/delete';
  static const postLike = '${baseURL}post-like';
  static const postCount = '${baseURL}post/count/account-id';

  /// comments
  static const findComments = '${baseURL}comment/find-all';
  static const createComment = '${baseURL}comment/create';
  static const deleteComment = '${baseURL}comment/delete';
  static const findReplies = '${baseURL}comment/find-all-replies';
  static const createReplay = '${baseURL}comment/reply';
  static const commentPin = '${baseURL}comment/pin';
  static const commentUnPin = '${baseURL}comment/unpin';

  /// settings
  static const settingFonts = '${baseURL}product/fonts';
  static const settingThemes = '${baseURL}product/themes';

  /// account score
  static const topScore = "account-score";
  static const accountTopScore = '$baseURL$topScore/find-all-by-top-score';
  static const accountTopWeekly = '$baseURL$topScore/find-all-by-top-weekly';
  static const accountTopMonthly = '$baseURL$topScore/find-all-by-top-monthly';
  static const accountTopYearly = '$baseURL$topScore/find-all-by-top-yearly';
}
