import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferences> init() async {
    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required bool value,
  }) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  static bool? getData({required String key}) {
    return _sharedPreferences!.getBool(key);
  }
}
