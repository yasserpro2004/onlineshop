import 'package:onlineshop/databases/hive_database.dart';
import 'package:onlineshop/models/models.dart';
import 'package:hive/hive.dart';
import 'package:onlineshop/repositories/wishlist/base_wishlist_repository.dart';

class WishlistRepository extends BaseWishlistRepository {
  @override
  Box<WishlistItem> get getWishlistProduct => HiveDatabase.returnWishlistBox();

  @override
  Future<void> updateWishlist(WishlistItem wishlistItem, bool isAdded) async {
    final wishlistBox = getWishlistProduct;
    if (isAdded) {
      wishlistBox.put(wishlistItem.productID, wishlistItem);
    } else {
      wishlistBox.delete(wishlistItem.productID);
    }
  }
}
