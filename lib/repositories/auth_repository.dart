import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/ApiPath.dart';
import '../api/network/base_client.dart';

class AuthRepository {
  _headers(String? token) {
    return {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer $token"};
  }

  _header() {
    return {"Accept": "application/json", "Content-Type": "application/json"};
  }

  //final Dio _dio = Dio();
  //final String _baseUrl = "https://ezyappteam.ezycourse.com/api/app/student/auth/login";

  Future<String> login({required String email, required String password}) async {
    try {
      //final response = await _dio.post(_baseUrl, data: {'email': email, 'password': password, 'app_token': " "});
      //   if (response.statusCode == 200) {
      //     final data = response.data;
      //     final token = data['token'];
      //     emit(AuthSuccess(token: token));
      //   } else {
      //     emit(AuthFailure(error: "Invalid credentials"));
      //   }

      var response = await BaseClient().post(ApiPath.login, body: {'email': email, 'password': password, 'app_token': " "}, header: _header());

      if (response != null) {
        final token = response['token'];
        print("Token: $token");
        await _saveToken(token);
        return token;
      } else {
        throw Exception("Invalid credentials");
      }
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var response = await BaseClient().post(ApiPath.logout, body: {}, header: _headers(token));

    print("Response: $response");

    await prefs.remove('token');
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
