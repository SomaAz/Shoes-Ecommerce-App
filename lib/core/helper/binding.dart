import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/discover_view_model.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => DiscoverViewModel());
  }
}
