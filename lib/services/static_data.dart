import 'package:shared_preferences/shared_preferences.dart';

Future<void> setIntro() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool('intro', true);
}

Future<bool> getIntro() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('intro');
}

Future<void> setUserId(String id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('UserId', id);
}

Future<void> removeUserId() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove('UserId');
}

Future<String> getUserId() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString('UserId');
}
