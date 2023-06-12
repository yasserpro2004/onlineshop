import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/services/helper.dart';

import '../../models/models.dart';

class MenShoesNotifier extends ChangeNotifier {
  List<Product> _products = [];
  MenShoesNotifier() {
    Helper().fetchMaleSneakers().then((products) {
      _products = products;
      notifyListeners();
    });
  }
  List<Product> get menProducts => _products;
}
