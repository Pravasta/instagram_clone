import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  Future<void> setPref(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getPref(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<void> deleteToken(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> setMap(String key, Map<String, dynamic> map) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(map);
    await prefs.setString(key, jsonString);
  }

  Future<Map<String, dynamic>> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    } else {
      return {};
    }
  }
}
