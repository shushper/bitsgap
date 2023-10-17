import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const keyAuthorized = 'authorized';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> setAuthorized(bool authorized) {
    return _setBooleanValue(keyAuthorized, authorized);
  }

  Future<bool> isAuthorized() {
    return _readBooleanValue(keyAuthorized);
  }

  Future<bool> _setBooleanValue(String key, bool value) async {
    final prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  Future<bool> _readBooleanValue(String key) async {
    final prefs = await _prefs;
    if (prefs.containsKey(key)) {
      return prefs.getBool(key) ?? false;
    } else {
      return false;
    }
  }
}
