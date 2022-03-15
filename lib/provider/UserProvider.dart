import 'package:flutter/cupertino.dart';
import 'package:hourse_life/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel user;

  addUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }

  deleteUser(UserModel user) {
    this.user = null;
    notifyListeners();
  }

  UserModel GetUser() {
    return user;
  }
}
