import 'package:flutter/material.dart';

import '../../repositories/repositories.dart';

class CartNotifier extends ChangeNotifier {
  List<Map<String, dynamic>> _cartProducts = [];

  CartNotifier() {
    CartRepository().getCartProducts().then((data) {
      _cartProducts = data;
      notifyListeners();
    });
  }

  List<Map<String, dynamic>> get cartProducts => _cartProducts;
  double get totalPrice => _cartProducts.fold(
        0,
        (sum, product) {
          return sum + (product['price'] * product['qty']);
        },
      );

  double get deliveryFee => totalPrice < 200 ? 20 : 0;

  double get netValue => totalPrice + deliveryFee;

  String get totalPriceString => totalPrice.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee.toStringAsFixed(2);

  String get netValueString => netValue.toStringAsFixed(2);


  Future<void> updateCart(Map<String, dynamic> newProductCart) async {
    await CartRepository().updateProduct(newProductCart);
    final productID = newProductCart['id'];
    final productIndex = containsProductId(_cartProducts, productID);
    if (productIndex != -1) {
      final currentProduct = _cartProducts[productIndex];
      final currentQty = currentProduct['qty'] as int;
      _cartProducts[productIndex] = newProductCart;
      _cartProducts[productIndex]['qty'] = currentQty + 1;
    } else {
      _cartProducts.insert(0, newProductCart);
    }
    notifyListeners();
  }

  Future<void> removeProductCart(dynamic productID) async {
    await CartRepository().removeProduct(productID);
    final productIndex = containsProductId(_cartProducts, productID);
    if (productIndex != -1) {
      _cartProducts[productIndex]['qty'] -= _cartProducts[productIndex]['qty'];
    } else {
      _cartProducts.removeAt(productIndex);
    }
    notifyListeners();
  }

  Future<void> removeWholeProductFromCart(dynamic productID) async {
    await CartRepository().removeWholeProduct(productID);
    final productIndex = containsProductId(_cartProducts, productID);
    _cartProducts.removeAt(productIndex);
    notifyListeners();
  }
}

int containsProductId(
    List<Map<String, dynamic>> cartProducts, String productId) {
  for (int i = 0; i < cartProducts.length; i++) {
    if (cartProducts[i].containsKey(productId)) {
      return i;
    }
  }
  return -1;
}
