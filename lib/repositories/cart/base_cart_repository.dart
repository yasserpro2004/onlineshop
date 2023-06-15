import 'package:hive/hive.dart';

import '../../models/models.dart';

abstract class BaseCartRepository {
  Box<CartItem> get getCartProducts;
  Future<void> updateProduct(CartItem cartItem);
  Future<void> removeProduct(String productID);
  Future<void> removeWholeProduct(String productID);
  Future<void> incrementProduct(String productID);
}