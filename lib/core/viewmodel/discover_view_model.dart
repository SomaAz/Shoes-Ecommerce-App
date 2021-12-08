import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverViewModel extends GetxController {
  String _selectedCategory = "";
  String get selectedCategory => _selectedCategory;
  String _search = "";
  String get search => _search;
  RangeValues _priceRange = RangeValues(1, 100);
  RangeValues get priceRange => _priceRange;
  int _size = 0;
  int get size => _size;
  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    update();
    print("category: $category");
  }

  void initSelectedCategory(String category) {
    if (_selectedCategory.isEmpty) {
      _selectedCategory = category;
      update();
      print("init:category: $category");
    }
  }

  void setSearch(String value) {
    _search = value;
    update();
    print(_search);
  }

  void clearFilters() {
    _priceRange = RangeValues(1, 100);
    _size = 0;
    _isFiltered = false;
    update();
  }

  void setPriceRangeAndSize(RangeValues priceRange, int size) {
    _priceRange = priceRange;
    _size = size;
    _isFiltered = true;
    print({
      "priceRange": _priceRange,
      "size": _size,
    });
    update();
  }
}
