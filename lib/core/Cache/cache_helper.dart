import 'package:shared_preferences/shared_preferences.dart';

// Shared preferences & Cache Helper
// Singleton design pattern & Service Locator

class CacheHelper {
  static late SharedPreferences _prefs;

  //! Here The Initialize of cache
  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //! this method to put data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    } else if (value is String) {
      return await _prefs.setString(key, value);
    } else {
      return await _prefs.setStringList(key, value);
    }
  }

  //! this method to get data already saved in local database
  dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  // String? getDataString({required String key}) {
  //   return _prefs.getString(key);
  // }

  //! remove data using specific key
  Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  Future<bool> clearData() async {
    return await _prefs.clear();
  }

  //! this method to check if local database contains {key}
  bool containsData({required String key}) {
    return _prefs.containsKey(key);
  }

  //! this fun to put data in local data base using key
  // Future<dynamic> put({required String key, required dynamic value}) async {
  //   if (value is String) {
  //     return await _prefs.setString(key, value);
  //   } else if (value is bool) {
  //     return await _prefs.setBool(key, value);
  //   } else {
  //     return await _prefs.setInt(key, value);
  //   }
  // }
}
