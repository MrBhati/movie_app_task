import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? _sharedPreferences;

  // auth bloc sharred pref
  setUserId({required String userId}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString("userId", userId);
  }

  Future<String> getUserId() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return "";
  }

  clearSharedPref({required String userId}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.clear();
  }
}
