import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;
// share
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData({String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> setData({
    String key,
    dynamic value,
  }) async {
    return sharedPreferences.setString(key, value);
  }
}
