import 'package:hive/hive.dart';
import 'package:onlineshop/models/models.dart';

abstract class BaseWishlistRepository {
  Box<WishlistItem> get getWishlistProduct;
  Future<void> updateWishlist(WishlistItem wishlistItem,bool isAdded);
}
