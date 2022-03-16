import 'package:flutter/cupertino.dart';
import 'package:hourse_life/models/user.dart';

class UserProvider extends ChangeNotifier {
  User user;

  addUser(User user) {
    this.user = user;
    notifyListeners();
  }

  deleteUser(User user) {
    this.user = null;
    notifyListeners();
  }

  User GetUser() {
    return user;
  }
}
