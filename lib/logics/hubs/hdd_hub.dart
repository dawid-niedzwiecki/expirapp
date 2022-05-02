import 'package:shared_preferences/shared_preferences.dart';

class HddHub {
  HddHub._internal();

  factory HddHub() {
    return _instance;
  }

  static final HddHub _instance = HddHub._internal();

  late SharedPreferences _prefs;

  Future<void> initHub() async {
    _prefs = await SharedPreferences.getInstance();
  }
}