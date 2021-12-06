import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:shoes_ecommerce_app/view/discover_view.dart';
import 'package:shoes_ecommerce_app/view/explore_view.dart';
import 'package:shoes_ecommerce_app/view/my_bag_view.dart';
import 'package:shoes_ecommerce_app/view/notifications_view.dart';
import 'package:shoes_ecommerce_app/view/profile_view.dart';

class HomeView extends GetWidget<HomeViewModel> {
  final List<Widget> _pages = [
    DiscoverView(),
    ExploreView(),
    MyBagView(),
    NotificationsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (ctr) {
        return Scaffold(
          body: _pages[ctr.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedFontSize: 18,
            unselectedFontSize: 18,
            selectedItemColor: Get.theme.primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: ctr.currentPage,
            iconSize: 28,
            onTap: (index) => ctr.changePage(index),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_rounded),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: "●",
              ),
            ],
          ),
        );
      },
    );
  }
}
