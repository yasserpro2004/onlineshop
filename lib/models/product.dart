import 'dart:convert';
import 'package:uuid/uuid.dart';

List<Product> productFromJson(String str) => List<Product>.from(
      json.decode(str).map(
            (x) => Product.fromJson(x),
          ),
    );

class Product {
  final String uid;
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  }) : uid = const Uuid().v4();

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"] ?? '',
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"] ??'',
        title: json["title"]?? '',
      );

  @override
  bool operator ==(covariant Product other) {
    return uid == other.uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
