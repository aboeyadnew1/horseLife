import 'dart:convert';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:hourse_life/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

// share
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData({String key}) {
    return sharedPreferences.get(key);
  }

  static User getModelData({String key}) {
    String userPref = sharedPreferences.getString('user');
  Map<String,dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
  return User.fromMap(userMap);
  }

  static Future<bool> setModelData({
    String key,
    User data,
  }) async {
    Map<String, dynamic> user = {
      'id': data.id,
      'name': data.name,
      'phone': data.phone,
      'password': data.password,
      'image': data.image
    };

    return await sharedPreferences.setString('user', jsonEncode(user));
  }

  static Future<bool> setData({
    String key,
    dynamic value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }
}
