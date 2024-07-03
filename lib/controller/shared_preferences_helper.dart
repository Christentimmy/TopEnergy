import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _emailKey = 'email';
  static const String _otpCodeKey = 'otpCode';
  static const String _tokenKey = 'token';

  static Future<void> saveUserData(
      String email, int otpCode, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setInt(_otpCodeKey, otpCode);
    await prefs.setString(_tokenKey, token);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString(_emailKey);
    final int? otpCode = prefs.getInt(_otpCodeKey);
    final String? token = prefs.getString(_tokenKey);

    return {
      'email': email,
      'otpCode': otpCode,
      'token': token,
    };
  }
}
