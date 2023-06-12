import 'package:flutter/material.dart';

class PageIndicator extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }

  void reset() {
    _pageIndex = 0;
  }
}
