import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {

  static ShareHelper helper = ShareHelper._();

  ShareHelper._();

  void setTheme({required bool theme}) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    s1.setBool("mode", theme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    bool? theme1 = s1.getBool("mode");
    return theme1;
  }
}