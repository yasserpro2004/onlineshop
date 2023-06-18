//import 'package:onlineshop/services/helper.dart';

import 'package:uuid/uuid.dart';

import '../models.dart';

class KidsShoesModel {
  final String id;
  List<Product> products = [];
  bool isLoaded = false;
  KidsShoesModel() : id = const Uuid().v4();
  @override
  bool operator ==(covariant KidsShoesModel other) => id == other.id;
  @override
  int get hashCode => id.hashCode;
}
