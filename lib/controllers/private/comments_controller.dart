import 'package:almas/models/private/comments/comments_response.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/requests/comments/comments.dart';

class CommentsController {
  static Future<void> getReplays({
    required num? commentID,
    int? limit,
    required void Function(CommentsResponse response) callback,
  }) async {
    final response = await CommentsService.getReplays(commentID);

    if (response != null) {
      final items = (response["filteredReplies"] as List).map((e) {
        return CommentModel.fromJson(e);
      }).toList();

      final result = CommentsResponse.fromJson(
        json: response,
        data: items,
        nameItems: "filteredReplies",
      );
      callback(result);
    }
  }
}
