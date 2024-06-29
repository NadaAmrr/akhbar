

import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int selectedIndex = 0;
  /// change Index
  void changeIndex(index) {
  selectedIndex = index;
  notifyListeners();
  }
}