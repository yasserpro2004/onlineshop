import 'package:flutter/material.dart';
import 'package:onlineshop/models/models.dart';
import 'package:onlineshop/repositories/repositories.dart';

class DataProvider extends ChangeNotifier {
  FemaleShoesModel femaleShoes = FemaleShoesModel();
  KidsShoesModel kidsShoes = KidsShoesModel();
  MaleShoesModel maleShoes = MaleShoesModel();

  DataProvider() {
    DataRepository().fetchFemaleSneakers().then((femaleShoesModel) {
      femaleShoes = femaleShoesModel;
      notifyListeners();
    });
    DataRepository().fetchKidsSneakers().then((kidsShoesModel) {
      kidsShoes = kidsShoesModel;
      notifyListeners();
    });
    DataRepository().fetchMaleSneakers().then((maleShoesModel) {
      maleShoes = maleShoesModel;
      notifyListeners();
    });
  }
}
