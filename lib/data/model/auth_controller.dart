import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;
  String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
  }

  static bool get isLoggedIn{
    return _accessToken != null;
  }

}
