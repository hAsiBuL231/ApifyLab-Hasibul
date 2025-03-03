import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

const String prefsKeyUserToken = "prefsKeyUserToken";
const String prefsKeyUserId = "prefsKeyUserId";
const String prefsKeyUserPhoneNo = "prefsKeyUserPhoneNo";
const String prefsKeyLogout = "prefsKeyLogout";
const String prefsKeyIsLogin = "prefsKeyIsLogin";

@Injectable()
class AppPreferences {
  final _sharedPreferences = GetIt.instance<SharedPreferences>();

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyUserToken, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyUserToken) ?? "";
  }

  Future<void> setUserId(String userId) async {
    _sharedPreferences.setString(prefsKeyUserId, userId);
  }

  Future<String> getUserId() async {
    return _sharedPreferences.getString(prefsKeyUserId) ?? "";
  }

  Future<bool> getIsLogin() async {
    return _sharedPreferences.getBool(prefsKeyIsLogin) ?? false;
  }
}
