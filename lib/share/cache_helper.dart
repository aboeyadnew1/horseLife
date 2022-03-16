import 'dart:convert';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:hourse_life/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

  static Future<User> getModelData({String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();

    if(sharedPreferences.getString('user')!=null){
      String userPref = sharedPreferences.getString('user');
      Map<String,dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
      return User.fromMap(userMap);
    }else{
      return null;
    }

  }

  static Future<bool> setModelData({
    String key,
    User data,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> user = {
      'id': data.id,
      'name': data.name,
      'phone': data.phone,
      'password': data.password,
      'image': data.image
    };

    return await sharedPreferences.setString('user', jsonEncode(user));
  }


}
