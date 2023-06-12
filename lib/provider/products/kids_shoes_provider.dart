import 'package:flutter/material.dart';
import 'package:onlineshop/services/helper.dart';

import '../../models/models.dart';

class KidsShoesNotifier extends ChangeNotifier {
  List<Product> _products = [];
  KidsShoesNotifier() {
    Helper().fetchKidsSneakers().then((products) {
      _products = products;
      notifyListeners();
    });
  }
  List<Product> get kidsProducts => _products;
}
