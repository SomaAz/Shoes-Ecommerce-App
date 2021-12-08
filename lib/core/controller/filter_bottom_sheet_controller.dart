import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheetController extends GetxController {
  RangeValues _priceRange = RangeValues(1, 100);
  RangeValues get priceRange => _priceRange;
  int _selectedSize = 0;
  int get selectedSize => _selectedSize;
  bool _isInitialized = false;
  FilterBottomSheetController(this._priceRange, this._selectedSize);

  void setPriceRange(RangeValues values) {
    _priceRange = values;
    update();
  }

  void setSelectedSize(int size) {
    _selectedSize = size;
    update();
  }

  void initValues(RangeValues values, int size) {
    if (!_isInitialized) {
      _priceRange = values;
      _selectedSize = size;
      _isInitialized = true;
      update();
    }
  }
}
