import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:onlineshop/models/models.dart';
import 'package:onlineshop/repositories/wishlist/wishlist_repository.dart';

class WishlistNotifier extends ChangeNotifier {
  late Box<WishlistItem> _wishlistProducts;

  bool _isDataLoaded = false;

  final WishlistRepository _wishlistRepository = WishlistRepository();

  WishlistNotifier() {
    _wishlistProducts = _wishlistRepository.getWishlistProduct;
    _isDataLoaded = true;
    notifyListeners();
  }

  Box<WishlistItem> get wishlistProducts => _wishlistProducts;
  bool get isDataLoaded => _isDataLoaded;

  Future<void> updateData(WishlistItem wishlistItem, bool isAdded) async {
    _wishlistRepository.updateWishlist(wishlistItem, isAdded);
    notifyListeners();
  }

/*   bool getFavoriteProductByKey(String productID) {
    return _wishlistProducts.containsKey(productID);
  } */
}
