import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop/config/constant/constants.dart';
import 'package:onlineshop/models/models.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    
    Hive.init(appDir.path);

    Hive.registerAdapter(CartItemAdapter());
    Hive.registerAdapter(WishlistItemAdapter());

    await Hive.openBox<CartItem>(AppDatabasesName.cartBoxName,
        path: appDir.path);
    await Hive.openBox<WishlistItem>(AppDatabasesName.wishlistBoxName,
        path: appDir.path);
  }

  static Box<CartItem> returnCartBox() {
    return Hive.box(AppDatabasesName.cartBoxName);
  }

  static Box<WishlistItem> returnWishlistBox() {
    return Hive.box(AppDatabasesName.wishlistBoxName);
  }
}
