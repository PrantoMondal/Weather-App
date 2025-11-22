import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static PreferenceManager get to => Get.find<PreferenceManager>();

  final _prefs = SharedPreferences.getInstance();

  Future<String> getString(String key, {String defaultValue = ""}) {
    return _prefs.then((prefs) => prefs.getString(key) ?? defaultValue);
  }

  Future<bool> setString(String key, String value) {
    return _prefs.then((prefs) => prefs.setString(key, value));
  }

  Future<int> getInt(String key, {int defaultValue = 0}) {
    return _prefs.then((prefs) => prefs.getInt(key) ?? defaultValue);
  }

  Future<bool> setInt(String key, int value) {
    return _prefs.then((prefs) => prefs.setInt(key, value));
  }

  Future<double> getDouble(String key, {double defaultValue = 0.0}) {
    return _prefs.then((prefs) => prefs.getDouble(key) ?? defaultValue);
  }

  Future<bool> setDouble(String key, double value) {
    return _prefs.then((prefs) => prefs.setDouble(key, value));
  }

  Future<bool> getBool(String key, {bool defaultValue = false}) {
    return _prefs.then((prefs) => prefs.getBool(key) ?? defaultValue);
  }

  Future<bool> setBool(String key, bool value) {
    return _prefs.then((prefs) => prefs.setBool(key, value));
  }

  Future<List<String>> getStringList(String key, {List<String> defaultValue = const []}) {
    return _prefs.then((prefs) => prefs.getStringList(key) ?? defaultValue);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _prefs.then((prefs) => prefs.setStringList(key, value));
  }

  Future<bool> remove(String key) {
    return _prefs.then((prefs) => prefs.remove(key));
  }

  Future<bool> clear() {
    return _prefs.then((prefs) => prefs.clear());
  }
}
