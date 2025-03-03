import 'package:shared_preferences/shared_preferences.dart';

import '../api/ApiPath.dart';
import '../api/network/base_client.dart';

class CommentRepository {
  _headers(String? token) {
    return {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $token"};
  }

  Future<void> fetchComments(String text) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var response = await BaseClient().get(ApiPath.fetchComments,
        header: _headers("$token"));
  }

  Future<void> createComments(String text) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var response = await BaseClient().post(ApiPath.createComments,
        body: {'feed_txt': text, 'community_id': 2914, 'space_id': 5883, 'uploadType': 'text', 'activity_type': 'group', 'is_background': 0},
        header: _headers("$token"));
  }
}
