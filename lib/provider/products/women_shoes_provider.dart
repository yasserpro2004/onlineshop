import 'package:flutter/material.dart';
import 'package:onlineshop/services/helper.dart';

import '../../models/models.dart';

class WomenShoesNotifier extends ChangeNotifier {
  List<Product> _products = [];
  WomenShoesNotifier() {
    Helper().fetchFemaleSneakers().then((products) {
      _products = products;
      notifyListeners();
    });
  }
  List<Product> get womenProducts => _products;
}
