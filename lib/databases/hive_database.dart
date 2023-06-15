import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop/config/constant/constants.dart';
import 'package:onlineshop/models/models.dart';
import 'package:path_provider/path_provider.dart' ;

class HiveDatabase {
  static Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    Hive.registerAdapter(CartItemAdapter());
    await Hive.openBox<CartItem>(AppDatabasesName.cartBoxName,path: appDir.path);
    //await Hive.openBox<WishlistItem>(AppDatabasesName.wishlistBoxName);
  }

  static  Box<CartItem> returnCartBox() {
    return  Hive.box(AppDatabasesName.cartBoxName);
  }
}
