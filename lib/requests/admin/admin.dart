class AdminService {
  static Future<bool?> ban(num userID) async {
    // final response = await HttpRequest.put(
    //   path: "$banPath$userID",
    //   body: {},
    // );
    //
    // if (response != null && response == "ok") {
    //   return true;
    // }
    return null;
  }

  static Future<bool?> unban(num userID) async {
    // final response = await HttpRequest.put(
    //   path: "$unbanPath$userID",
    //   body: {},
    // );
    //
    // if (response != null && response == "ok") {
    //   return false;
    // }
    return null;
  }

  static Future<bool?> changeRole(String id) async {
    // final response = await HttpRequest.put(
    //   path: "$unbanPath$id",
    //   body: {},
    // );
    //
    // if (response != null && response["message"] == "ok") {
    //   return false;
    // }
    return null;
  }
}
