import 'package:almas/controllers/public/notifications/messaging_controller.dart';
import 'package:almas/data-server/socket_io/const.dart';
import 'package:almas/models/private/comments/models/comment_model.dart';
import 'package:almas/models/private/posts/models/post_model.dart';
import 'package:almas/models/public/enums.dart';
import 'package:almas/models/public/notification_parameters.dart';
import 'package:almas/repositories/repositories_handler.dart';

class MessagingEventing {
  final user = RepositoriesHandler.getUserData;

  static MessagingEventing instance = MessagingEventing();

  void likePost(PostModel model) {
    MessagingController.send(
      event: SubEventsSocket.likes,
      parameters: MessageParameters(
        roomID: model.account?.id,
        profile: user?.avatar,
        username: user?.username,
        postId: model.id,
        namePost: model.content,
      ),
    );
  }

  void createComment(PostModel model) {
    MessagingController.send(
      event: SubEventsSocket.comment,
      parameters: MessageParameters(
        roomID: model.account?.id,
        profile: user?.avatar,
        username: user?.username,
        postId: model.id,
        namePost: model.content,
      ),
    );
  }

  void replyComment(PostModel post, CommentModel comment) {
    MessagingController.send(
      event: SubEventsSocket.reply,
      parameters: MessageParameters(
        roomID: comment.account?.id,
        profile: user?.avatar,
        username: user?.username,
        postId: post.id,
        namePost: post.content,
        comment: comment.content,
      ),
    );
  }

  void follow(num? userID) {
    MessagingController.send(
      event: SubEventsSocket.follow,
      parameters: MessageParameters(
        roomID: userID,
        userId: user?.id,
        profile: user?.avatar,
        username: user?.username,
      ),
    );
  }

  void deletePostByManager(num? userID, String? content) {
    MessagingController.send(
      event: SubEventsSocket.removePost,
      parameters: MessageParameters(
        roomID: userID,
        namePost: content,
      ),
    );
  }

  void deleteAvatarByManager(num? userID) {
    MessagingController.send(
      event: SubEventsSocket.removeAvatar,
      parameters: MessageParameters(roomID: userID),
    );
  }

  void updateUserRole(num? userID, UserRole upgradeTo) {
    MessagingController.send(
      event: SubEventsSocket.updateUserRole,
      parameters: MessageParameters(
        roomID: userID,
        upgradeTo: upgradeTo,
      ),
    );
  }

  void activeUserTick(num? userID) {
    MessagingController.send(
      event: SubEventsSocket.activeUserTick,
      parameters: MessageParameters(roomID: userID),
    );
  }

  void activeUserFacilities(num? userID, MoneyFacilities facilities) {
    MessagingController.send(
      event: SubEventsSocket.activeFacilities,
      parameters: MessageParameters(
        roomID: userID,
        ability: facilities,
      ),
    );
  }
}
