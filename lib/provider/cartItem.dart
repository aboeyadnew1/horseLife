import 'package:flutter/cupertino.dart';
import 'package:hourse_life/models/service.dart';

class CartItem extends ChangeNotifier {
  List<ServiceModel> products = [];

  addProduct(ServiceModel product) {
    products.add(product);
    notifyListeners();
  }

  deleteProduct(ServiceModel product) {
    products.remove(product);
    notifyListeners();
  }

  deleteProducts() {
    products = [];
    notifyListeners();
  }
}
