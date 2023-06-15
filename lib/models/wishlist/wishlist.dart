import 'package:hive/hive.dart';

import '../../config/constant/constants.dart';

part 'wishlist.g.dart';

@HiveType(typeId: 2, adapterName: AppDatabasesName.wishlistAdaptorName)
class WishlistItem extends HiveObject {
  @HiveField(0)
  late String productID;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String category;
  @HiveField(3)
  late String imageURL;
  @HiveField(4)
  late double price;
}
