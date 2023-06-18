import 'package:uuid/uuid.dart';
import '../models.dart';

class MaleShoesModel {
  String id;
  List<Product> products = [];
  bool isLoaded = false;
  MaleShoesModel() : id = const Uuid().v4();
  @override
  bool operator ==(covariant MaleShoesModel other) => id == other.id;
  @override
  int get hashCode => id.hashCode;
}
