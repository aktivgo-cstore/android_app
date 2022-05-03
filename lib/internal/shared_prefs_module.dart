import 'package:shared_preferences/shared_preferences.dart';

import '../core/shared_prefs.dart';

class SharedPrefsModule {
  static SharedPrefs? _sharedPrefs;

  static SharedPrefs sharedPrefs() {
    _sharedPrefs = _sharedPrefs ?? SharedPrefs();
    return _sharedPrefs!;
  }
}
