import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/response/auth_response.dart';

class SharedPreferencesUtils {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setString(key, value);
    }
  }

  static Future<bool> removeData({required String key}) async {
    return sharedPreferences.remove(key);
  }

  static Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // Save user data to SharedPreferences
  static Future<void> saveDataUserPref(AuthResponse user) async {
    String userJson = jsonEncode(user.toJson());
    await sharedPreferences.setString('user_data', userJson);
  }

  // Retrieve user data from SharedPreferences
  static Future<AuthResponse?> getDataUserPref() async {
    String? userJson = sharedPreferences.getString('user_data');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return AuthResponse.fromJson(userMap);
    }
    return null;
  }

  // Clear user data from SharedPreferences
  static Future<void> clearDataUserPref() async {
    await sharedPreferences.remove('user_data');
  }
}
