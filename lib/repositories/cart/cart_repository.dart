import 'package:hive/hive.dart';
import 'package:onlineshop/databases/hive_database.dart';
import '../../models/models.dart';
import 'base_cart_repository.dart';

class CartHiveRepository extends BaseCartRepository {
  @override
  Box<CartItem> get getCartProducts => HiveDatabase.returnCartBox();

  @override
  Future<void> updateProduct(CartItem cartItem) async {
    final cartBox = getCartProducts;
    final key = cartBox.keys.firstWhere(
        (key) => cartBox.get(key)?.id == cartItem.id,
        orElse: () => null);
    if (key != null) {
      final item = cartBox.get(key) as CartItem;
      final int qty = item.qty + 1;
      item.qty = qty;
      item.sizes = cartItem.sizes;
      await item.save();
    } else {
      await cartBox.put(cartItem.id, cartItem);
    }
  }

  @override
  Future<void> removeProduct(String productID) async {
    final cartBox = getCartProducts;

    final item = cartBox.get(productID) as CartItem;

    if (item.qty > 1) {
      final int qty = item.qty - 1;
      item.qty = qty;
      await item.save();
    } else {
      await cartBox.delete(item.key);
    }
  }

  @override
  Future<void> removeWholeProduct(String productID) async {
    final cartBox = getCartProducts;
    await cartBox.delete(productID);
  }

  @override
  Future<void> incrementProduct(String productID) async {
    final cartBox = getCartProducts;

    final item = cartBox.get(productID) as CartItem;
    final int qty = item.qty + 1;
    item.qty = qty;
    await item.save();
  }
}
