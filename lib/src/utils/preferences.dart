import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static String get firstPage =>_preferences.getString("first_page") ?? 'steps';
  static set firstPage(String page) => _preferences.setString("first_page", page);
  
}