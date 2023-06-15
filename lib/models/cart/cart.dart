import 'package:hive/hive.dart';
import 'package:onlineshop/config/constant/constants.dart';

part 'cart.g.dart';

@HiveType(typeId: 1, adapterName: AppDatabasesName.cartAdaptorName)
class CartItem extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String category;
  @HiveField(3)
  late List<String> sizes;
  @HiveField(4)
  late String imageURL;
  @HiveField(5)
  late double price;
  @HiveField(6)
  late int qty;
}
