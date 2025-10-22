import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageService {
  static const String _googleTokenKey = 'google_id_token';
  static const String _accessTokenKey = 'access_token';

  // Store Google ID Token
  static Future<void> storeGoogleToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_googleTokenKey, token);
  }

  // Get Google ID Token
  static Future<String?> getGoogleToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_googleTokenKey);
  }

  // Store Access Token
  static Future<void> storeAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  // Get Access Token
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  // Clear all tokens
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_googleTokenKey);
    await prefs.remove(_accessTokenKey);
  }

  // Check if user has tokens (is logged in)
  static Future<bool> hasTokens() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_googleTokenKey) ||
        prefs.containsKey(_accessTokenKey);
  }
}
