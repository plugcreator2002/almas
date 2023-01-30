import 'package:almas/data-server/server_interface/requests/account/account.dart';
import 'package:almas/models/private/user_model.dart';
import 'package:almas/providers/config/parent_provider.dart';

class SearchUsersPresenter extends ParentProvider {
  List<UserModel> users = [];

  Future<void> getSearchUsers({required String content}) async {
    if (content.isEmpty) {
      users = [];
      notifyListeners();
      return;
    }
    final result = await AccountService.searchUsers(content);

    if (result.isNotEmpty) {
      final items = result.map((e) {
        return UserModel.fromJson(e);
      }).toList();

      users = items;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    users = [];
  }
}
