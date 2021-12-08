import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (ctr) {
        return Scaffold(
          body: PageView(
            children: _pages,
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedFontSize: 20,
            unselectedFontSize: 20,
            selectedItemColor: Get.theme.primaryColor,
            unselectedItemColor: Colors.grey[500],
            currentIndex: ctr.currentPage,
            iconSize: 30,
            onTap: (index) {
              ctr.changePage(index);
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: "●",
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag_rounded),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                activeIcon: Icon(Icons.notifications_rounded),
                label: "●",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person_rounded),
                label: "●",
              ),
            ],
          ),
        );
      },
    );
  }
}
