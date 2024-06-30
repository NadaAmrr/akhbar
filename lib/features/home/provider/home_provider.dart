import 'package:akhbar/core/enums/drawer_enum.dart';
import 'package:akhbar/models/category_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// To store category
  CategoryModel? selectedCategory;

  /// on category item clicked: Category tab --> category item
  void onCategoryItemClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    notifyListeners();
  }

  /// Drawer
  int selectedDrawerItem = 0;
  /// click: Drawer. Action: home screen
  onDrawerItemClick(int newSelectedDrawerItem, context) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    notifyListeners();
  }
}
