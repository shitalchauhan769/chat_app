import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {

  static ShareHelper helper = ShareHelper._();

  ShareHelper._();

  void setTheme({required String theme}) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    print(theme);
    s1.setString("mode", theme);
  }

  Future<String?> getTheme() async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    String? theme1 = s1.getString("mode");
    print(theme1);
    return theme1;
  }
}