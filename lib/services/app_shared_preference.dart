import 'package:shared_preferences/shared_preferences.dart';

late AppSharedPreference appSharedPreference;

class AppSharedPreference{
  SharedPreferences? _pref;

  static const String KEY_PERMISSION_LOCATION = "permission_location";

  static Future<dynamic> getInstance() async {
    var preferences = AppSharedPreference();
    preferences._pref = await SharedPreferences.getInstance();
    return preferences;
  }
  set isPermissionLocation(value)  {
    _pref?.setBool(KEY_PERMISSION_LOCATION, value);
  }

  get isPermissionLocation  {
    return  _pref?.getBool(KEY_PERMISSION_LOCATION) ?? false;
  }

}