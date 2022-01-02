import 'package:flutter/material.dart';
import 'package:garage_app/models/product.dart';

class CartProvider with ChangeNotifier {
  int _cartItemCount = 0;
  int get getCartItemCount => _cartItemCount;
  List<Product> cartProducts = [];

  // void increment() {
  //   _cartItemCount++;
  //   notifyListeners();
  // }

  // void decrement() {
  //   if (_cartItemCount > 0) _cartItemCount--;
  //   notifyListeners();
  // }

  void removeProduct(Product deleteProduct) {
    if (_cartItemCount <= 0) {
      return;
    }
    cartProducts.removeWhere((element) => deleteProduct.id == element.id);
    _cartItemCount--;
    notifyListeners();
  }

  void addProduct(Product product) {
    if (-1 != cartProducts.indexWhere((element) => product.id == element.id)) {
      return;
    }
    cartProducts.add(product);
    _cartItemCount++;
    notifyListeners();
  }

  bool checkProductInChart(Product product) {
    if (cartProducts.indexWhere((element) => product.id == element.id) == -1) {
      return false;
    }
    return true;
  }
}
