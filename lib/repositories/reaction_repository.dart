import 'package:shared_preferences/shared_preferences.dart';

import '../api/ApiPath.dart';
import '../api/network/base_client.dart';

class ReactionRepository {
  _headers(String? token) {
    return {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $token"};
  }

  Future<void> createOrUpdateReaction(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    print("Token: $token");

    var response = await BaseClient().post(ApiPath.createOrUpdateReaction,
        body: {'feed_id': id, 'reaction_type': 'LIKE', 'action': 'deleteOrCreate', 'reactionSource': 'COMMUNITY'}, header: _headers("$token"));
  }
}
