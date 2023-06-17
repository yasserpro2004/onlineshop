import '../models.dart';
import 'package:uuid/uuid.dart';

class FemaleShoesModel {
  final String id;
  List<Product> products = [];
  bool isLoaded = false;
  FemaleShoesModel() : id = const Uuid().v4();
  @override
  bool operator ==(covariant FemaleShoesModel other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
