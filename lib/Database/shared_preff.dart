import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// ? *************  Shared Preferences  *************
class SharedPref {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) {
    if (_prefs != null) _prefs!.setString(key, value);
  }

  static String getString(String key) {
    return _prefs == null ? 'DEFAULT_VALUE' : _prefs!.getString(key) ?? "";
  }

  static setInt(String key, int value) {
    if (_prefs != null) _prefs!.setInt(key, value);
  }

  static Future<int> getInt(String key) async {
    return _prefs == null ? 0 : _prefs!.getInt(key) ?? 0;
  }

  static setBool(String key, bool value) {
    if (_prefs != null) _prefs!.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    return _prefs == null ? false : _prefs!.getBool(key) ?? false;
  }

  static setDouble(String key, double value) {
    if (_prefs != null) _prefs!.setDouble(key, value);
  }

  static Future<double> getDouble(String key) async {
    return _prefs == null ? 0.0 : _prefs!.getDouble(key) ?? 0.0;
  }

  static setListString({required String key, required List<String> list}) {
    if (_prefs != null) _prefs!.setStringList(key, list);
  }

  static Future<List<String>> getListString(key) async {
    return _prefs == null ? [] : _prefs!.getStringList(key) ?? [];
  }

  static setMap(String key, Map<String, dynamic> map) {
    if (_prefs != null) _prefs!.setString(key, jsonEncode(map));
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    return _prefs == null ? {} : jsonDecode(_prefs!.getString(key) ?? "") ?? {};
  }

  static void clearSharedPref() {
    _prefs!.clear();
  }
}

// ====================================
class EXAMPLE {
  EXAMPLE() {
    SharedPref.setInt("counter", 1);
    SharedPref.getInt("counter");
    SharedPref.getInt("counter").then((value) {
     // print(value);
    });
  }
}
