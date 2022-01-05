import 'package:flutter/material.dart';
import 'package:garage_app/models/product.dart';

class CartProvider with ChangeNotifier {
  int _cartItemCount = 0;
  int get getCartItemCount => _cartItemCount;
  List<Product> cartProducts = [];

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

  bool checkProductInCart(Product product) {
    if (cartProducts.indexWhere((element) => product.id == element.id) == -1) {
      return false;
    }
    return true;
  }
  void clearCartProductList() {
    cartProducts.clear();
  }
  void clearCartItemCount(){
    _cartItemCount = 0 ;
  }
}
