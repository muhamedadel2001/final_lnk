import 'package:shared_preferences/shared_preferences.dart';
import 'my_cache_keys.dart';

class MyCache {
  static SharedPreferences? preferences;
  static Future<void> initCache() async {
    preferences = await SharedPreferences.getInstance();
  }

  static String? getDataString({required String key}) {
    return preferences!.getString(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await preferences!.setBool(key, value);
    }
    if (value is String) {
      return await preferences!.setString(key, value);
    }

    if (value is int) {
      return await preferences!.setInt(key, value);
    } else {
      return await preferences!.setDouble(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return preferences!.get(key);
  }

  static void setString({required MyCacheKeys key, required String value}) {
    preferences?.setString(key.name, value);
  }

  static String getString({required MyCacheKeys key}) {
    return preferences!.getString(key.name) ?? '';
  }

  static void setInt({required MyCacheKeys key, required int value}) {
    preferences!.setInt(key.name, value);
  }

  static int getInt({required MyCacheKeys key}) {
    return preferences!.getInt(key.name) ?? 0;
  }

  static void setDouble({required MyCacheKeys key, required double value}) {
    preferences!.setDouble(key.name, value);
  }

  static double? getDouble({required MyCacheKeys key}) {
    return preferences!.getDouble(key.name) ?? 0;
  }

  static void setBool({required MyCacheKeys key, required bool value}) {
    preferences!.setBool(key.name, value);
  }

  static bool? getBool({required MyCacheKeys key}) {
    return preferences!.getBool(key.name) ?? false;
  }

  static void setStringList({
    required MyCacheKeys key,
    required List<String> value,
  }) {
    preferences!.setStringList(key.name, value);
  }

  static List<String>? getStringList({required MyCacheKeys key}) {
    return preferences!.getStringList(key.name) ?? [];
  }

  static void removeFromCache({required MyCacheKeys key}) {
    preferences!.remove(key.name);
  }

  static void clearCache() {
    preferences!.clear();
  }
}
