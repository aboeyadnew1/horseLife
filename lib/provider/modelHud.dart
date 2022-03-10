import 'package:flutter/cupertino.dart';

class modelHud extends ChangeNotifier {
  bool isloading = false;

  changeisLoading(bool value) {
    isloading = value;
    notifyListeners();
  }
}
