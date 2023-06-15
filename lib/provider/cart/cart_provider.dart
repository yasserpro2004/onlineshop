import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:onlineshop/models/models.dart';

import '../../repositories/repositories.dart';

class CartNotifier extends ChangeNotifier {
  late Box<CartItem> _cartProducts;
  bool _isDataLoaded = false;
  final CartHiveRepository _cartHiveRepository = CartHiveRepository();

  CartNotifier() {
    _cartProducts = _cartHiveRepository.getCartProducts;
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
    await _cartHiveRepository.updateProduct(newProductCart);
    notifyListeners();
  }

  Future<void> removeProductCart(dynamic productID) async {
    await _cartHiveRepository.removeProduct(productID);
    notifyListeners();
  }

  Future<void> removeWholeProductFromCart(String productID) async {
    await _cartHiveRepository.removeWholeProduct(productID);
    notifyListeners();
  }

  Future<void> incrementProductInCart(String productID) async {
    await _cartHiveRepository.incrementProduct(productID);
    notifyListeners();
  }
}
