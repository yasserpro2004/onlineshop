import 'package:hive/hive.dart';

abstract class BaseCartRepository {
  Future<List<Map<String, dynamic>>> getCartProducts();
  Future<void> updateProduct(Map<String, dynamic> newProductCart);
  Future<void> removeProduct(dynamic productID);
  Future<void> removeWholeProduct(dynamic productID);
}

class CartRepository extends BaseCartRepository {
  @override
  Future<List<Map<String, dynamic>>> getCartProducts() async {
    final cartBox = Hive.box('cart_box');
    final products = cartBox.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList()
        .reversed
        .toList();
    cartBox.close();
    return products;
  }

  @override
  Future<void> updateProduct(Map<String, dynamic> newProductCart) async {
    final cartBox = Hive.box('cart_box');
    final productId = newProductCart['id'];

    if (cartBox.containsKey(productId)) {
      // If the product is already in the cart, update its quantity
      final currentProduct = cartBox.get(productId) as Map<String, dynamic>;
      final currentQty = currentProduct['qty'] as int;
      await cartBox.put(productId, {...newProductCart, 'qty': currentQty + 1});
    } else {
      // If the product is not in the cart, add it with a quantity of 1
      await cartBox.put(productId, {...newProductCart, 'qty': 1});
    }
    cartBox.close();
  }

  @override
  Future<void> removeProduct(dynamic productID) async {
    final cartBox = Hive.box('cart_box');
    final currentProduct = cartBox.get(productID) as Map<String, dynamic>;
    if (currentProduct['qty'] > 1) {
      await cartBox.put(
          productID, {...currentProduct, 'qty': currentProduct['qty'] - 1});
    } else {
      await cartBox.delete(productID);
    }
    cartBox.close();
  }

  @override
  Future<void> removeWholeProduct(dynamic productID) async {
    final cartBox = Hive.box('cart_box');
    await cartBox.delete(productID);
    cartBox.close();
  }
}
