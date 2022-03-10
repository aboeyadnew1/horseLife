import 'package:flutter/cupertino.dart';
import 'package:hourse_life/models/service.dart';

class CartItem extends ChangeNotifier {
  List<Service> products = [];

  addProduct(Service product) {
    products.add(product);
    notifyListeners();
  }

  deleteProduct(Service product) {
    products.remove(product);
    notifyListeners();
  }
  deleteProducts() {
    products=[];
    notifyListeners();
  }
}
