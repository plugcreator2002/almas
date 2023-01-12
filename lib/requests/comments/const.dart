import 'package:almas/repositories/repositories_config.dart';

const deleteCommentPath = "${RepositoriesConfig.baseURL}posts/comment/";
const pinCommentPath = "pin";
const unpinCommentPath = "unpin";

String createCommentPath(num? id) {
  return '${RepositoriesConfig.baseURL}posts/$id/comment';
}

String getCommentsPath(num? id) {
  return '${RepositoriesConfig.baseURL}posts/$id/comments';
}

String getReplaysPath(String? id) {
  return '${RepositoriesConfig.baseURL}posts/comments/$id/replies';
}

String pinsCommentPath(String? id, String path) {
  return '${RepositoriesConfig.baseURL}posts/comments/$id/$path';
}
