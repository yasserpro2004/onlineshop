import 'package:flutter/services.dart' as the_bundle;
import 'package:onlineshop/models/models.dart';

class DataRepository {
  Future<MaleShoesModel> fetchMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final myList = productFromJson(data);
    final MaleShoesModel maleShoesModel = MaleShoesModel()..products = myList;
    return maleShoesModel;
  }

  Future<FemaleShoesModel> fetchFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final myList = productFromJson(data);
    final FemaleShoesModel femaleShoesModel = FemaleShoesModel()
      ..products = myList;
    return femaleShoesModel;
  }

  Future<KidsShoesModel> fetchKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final myList = productFromJson(data);
    final KidsShoesModel kidsShoesModel = KidsShoesModel()..products = myList;
    return kidsShoesModel;
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
