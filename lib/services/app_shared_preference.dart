import 'package:shared_preferences/shared_preferences.dart';

late AppSharedPreference appSharedPreference;

class AppSharedPreference{
  SharedPreferences? _pref;

  static const String KEY_PERMISSION_LOCATION = "permission_location";
  static const String KEY_ONBOARDING_STATE = "onboarding_state";

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

  set isOnboarding(value)  {
    _pref?.setBool(KEY_ONBOARDING_STATE, value);
  }

  get isOnboarding  {
    return  _pref?.getBool(KEY_ONBOARDING_STATE) ?? false;
  }

}