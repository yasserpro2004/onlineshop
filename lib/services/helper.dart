import 'package:flutter/services.dart' as the_bundle;
import 'package:onlineshop/models/models.dart';

class Helper {
  Future<List<Product>> fetchMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final myList = productFromJson(data);
    return myList;
  }

  Future<List<Product>> fetchFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final myList = productFromJson(data);
    return myList;
  }

  Future<List<Product>> fetchKidsSneakers() async {
      final data =
          await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
      final myList = productFromJson(data);
      return myList;
  }

  Future<Product> getMaleSneakersByID(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final myList = productFromJson(data);
    final product = myList.firstWhere((element) => element.id == id);
    return product;
  }

  Future<Product> getFemaleSneakersByID(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final myList = productFromJson(data);
    final product = myList.firstWhere((element) => element.id == id);
    return product;
  }

  Future<Product> getKidsSneakersByID(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final myList = productFromJson(data);
    final product = myList.firstWhere((element) => element.id == id);
    return product;
  }
}
