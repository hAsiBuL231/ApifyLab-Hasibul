import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/ApiPath.dart';
import '../api/network/base_client.dart';
import '../model/post_full_model.dart';

class PostRepository {
  _headers(String? token) {
    return {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $token"};
  }

  _header() {
    return {"Accept": "application/json", "Content-Type": "application/json"};
  }

  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    //final response = await http.get(Uri.parse('https://ezyappteam.ezycourse.com/api/app/teacher/community/getFeed?status=feed&'));
    //final response = await _dio.post(_baseUrl, data: {'email': email, 'password': password, 'app_token': " "});

    var response = await BaseClient().post(ApiPath.getPost, body: {'community_id': 2914, 'space_id': 5883}, header: _headers("$token"));
    //var response = await BaseClient().post(ApiPath.getPost, body: {'community_id': 2914, 'space_id': 5883}, header: _headers("NzY3MDA.3BEOvfdiz4w1aV-2OeJvb4ehT-XoWzXM2ftcxqA1d7FRs1t5l_dYxavZzyLp"));

    //if (response.statusCode == 200) {
    //List<dynamic> jsonList = json.decode(response.body);
    //return jsonList.map((json) => Post.fromJson(json)).toList();
    List<Post> jsonList = [];
    for (var data in response) {
      print("$data");
      jsonList.add(Post.fromJson(data));
    }
    return jsonList;
    //} else {
    //throw Exception('Failed to load posts');
    //}
  }
}
