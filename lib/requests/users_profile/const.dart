import 'package:almas/repositories/repositories_config.dart';

const followPath = "follow";
const unfollowPath = "unfollow";

const blockPath = "block";
const unBlockPath = "unblock";

const reportCoverPath = "cover/report";
const reportAvatarPath = "avatar/report";

const isFollowingPath = "${RepositoriesConfig.baseURL}users/is-following";
const isBlockingPath = "${RepositoriesConfig.baseURL}users/is-blocking";

const getUserPath = "${RepositoriesConfig.baseURL}users/";

const changeRolePath = "${RepositoriesConfig.baseURL}admin/change-role/";

String followsUser(
  num? userID,
  String path,
) {
  return '${RepositoriesConfig.baseURL}users/$userID/$path';
}

String blocksUser(
  num userID,
  String path,
) {
  return '${RepositoriesConfig.baseURL}users/$userID/$path';
}

String reportUser(
  num userID,
  String path,
) {
  return '${RepositoriesConfig.baseURL}users/$userID/$path';
}
