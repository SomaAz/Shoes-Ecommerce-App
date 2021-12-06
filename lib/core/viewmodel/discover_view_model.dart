import 'package:get/get.dart';

class DiscoverViewModel extends GetxController {
  String _selectedCategory = "";
  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    update();
  }
}
