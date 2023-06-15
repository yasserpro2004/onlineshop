import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:onlineshop/models/models.dart';

import '../../repositories/repositories.dart';

class CartNotifier extends ChangeNotifier {
  late Box<CartItem> _cartProducts;
  bool _isDataLoaded = false;
  CartHiveRepository cartHiveRepository = CartHiveRepository();

  CartNotifier() {
    _cartProducts = cartHiveRepository.getCartProducts;
    _isDataLoaded = true;
    notifyListeners();
  }

  bool get isDataLoaded => _isDataLoaded;

  Box<CartItem> get cartProducts => _cartProducts;

  double get totalPrice => _cartProducts.values.toList().fold(
        0,
        (sum, product) {
          return sum + (product.price * product.qty);
        },
      );

  double get deliveryFee => totalPrice < 200 ? 20 : 0;

  double get netValue => totalPrice + deliveryFee;

  String get totalPriceString => totalPrice.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee.toStringAsFixed(2);

  String get netValueString => netValue.toStringAsFixed(2);

  Future<void> updateCart(CartItem newProductCart) async {
    await cartHiveRepository.updateProduct(newProductCart);

    /* final productID = newProductCart['id'];
    final productIndex = containsProductId(_cartProducts, productID);
    if (productIndex != -1) {
      final currentProduct = _cartProducts[productIndex];
      final currentQty = currentProduct['qty'] as int;
      _cartProducts[productIndex] = newProductCart;
      _cartProducts[productIndex]['qty'] = currentQty + 1;
    } else {
      _cartProducts.insert(0, newProductCart);
    } */
    notifyListeners();
  }

  Future<void> removeProductCart(dynamic productID) async {
    /* await CartRepository().removeProduct(productID);
    final productIndex = containsProductId(_cartProducts, productID);
    if (productIndex != -1) {
      _cartProducts[productIndex]['qty'] -= _cartProducts[productIndex]['qty'];
    } else {
      _cartProducts.removeAt(productIndex);
    } */
    await cartHiveRepository.removeProduct(productID);
    notifyListeners();
  }

  Future<void> removeWholeProductFromCart(String productID) async {
    await cartHiveRepository.removeWholeProduct(productID);
    notifyListeners();
  }

  Future<void> incrementProductInCart(String productID) async {
    await cartHiveRepository.incrementProduct(productID);
    notifyListeners();
  }
}
