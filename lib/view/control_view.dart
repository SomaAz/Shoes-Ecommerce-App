import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:shoes_ecommerce_app/view/auth/login_view.dart';
import 'package:shoes_ecommerce_app/view/auth/sign_up_view.dart';
import 'package:shoes_ecommerce_app/view/home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(builder: (control) {
      return Obx(() {
        if (control.user == null) {
          return control.page == "l" ? LoginView() : SignUpView();
        } else {
          return HomeView();
        }
      });
    });
  }
}
