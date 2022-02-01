import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();
  late SharedPreferences _prefs;
  factory UserPreferences() => _instancia;
  UserPreferences._internal();

  String get idName {
    return _prefs.getString('idName') ?? '1';
  }

  set idName(String value) {
    _prefs.setString('idName', value);
  }

  Future<SharedPreferences> initPrefs() async =>
      _prefs = await SharedPreferences.getInstance();
}
