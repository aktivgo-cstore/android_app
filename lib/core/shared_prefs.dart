import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) => _prefs.getBool(key);

  Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  String? getString(String key) => _prefs.getString(key);

  Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  int? getInt(String key) => _prefs.getInt(key);

  Future<bool> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  bool containsKey(String key) => _prefs.containsKey(key);

  Future<bool> remove(String key) async => await _prefs.remove(key);
}
