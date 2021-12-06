import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  changePage(int index) {
    _currentPage = index;
    update();
  }
}
