import 'package:shared_preferences/shared_preferences.dart';

/// Обертка вокруг SharedPreferences для удобства
class Settings {
  const Settings({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static const String _prefAccessToken = 'access_token';
  static const String _prefRefreshToken = 'refresh_token';
  static const String _darkModeEnabled = 'dark_mode_enabled';

  String? get accessToken => sharedPreferences.getString(_prefAccessToken);
  Future<void> setAccessToken(String value) async => sharedPreferences.setString(_prefAccessToken, value);

  String? get refreshToken => sharedPreferences.getString(_prefRefreshToken);
  Future<void> setRefreshToken(String value) async => sharedPreferences.setString(_prefRefreshToken, value);

  bool get darkMode => sharedPreferences.getBool(_darkModeEnabled) ?? false;
  Future<void> setDarkMode(bool value) async => sharedPreferences.setBool(_darkModeEnabled, value);
}
