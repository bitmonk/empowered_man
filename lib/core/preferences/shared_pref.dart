import 'package:empowered/core/preferences/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  // Constructor to initialize SharedPreferences
  AppSharedPref(this.sharedPreferences);
  final SharedPreferences sharedPreferences;
  // Tokens

  Future<void> remove(key) async {
    await sharedPreferences.remove(key);
  }

  Future<String?> getAccessToken() async {
    final value = sharedPreferences.getString(PreferenceKeys.accessToken);
    return value;
  }

  Future<void> saveAccessToken(String value) async {
    await sharedPreferences.setString(PreferenceKeys.accessToken, value);
  }

  Future<String?> getRefreshToken() async {
    final value = sharedPreferences.getString(PreferenceKeys.refreshToken);
    return value;
  }

  Future<void> saveRefreshToken(String value) async {
    await sharedPreferences.setString(PreferenceKeys.refreshToken, value);
  }

  Future<void> saveIsFirstRun() async {
    await sharedPreferences.setBool(PreferenceKeys.isFirstRun, false);
  }

  Future<bool> getIsFirstRun() async {
    final value = sharedPreferences.getBool(
      PreferenceKeys.isFirstRun,
    );
    if (value == null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveString(String key, String val) async {
    await sharedPreferences.setString(key, val);
  }

  Future<String?> getString(String val) async {
    final value = sharedPreferences.getString(val);
    return value;
  }

  Future<void> removeAll() async {
    await sharedPreferences.clear();
  }
}
