// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';

class modelHud extends ChangeNotifier {
  bool isloading = false;

  changeisLoading(bool value) {
    isloading = value;
    notifyListeners();
  }
}
