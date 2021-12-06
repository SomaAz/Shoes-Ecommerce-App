import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/service/firestore_service.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/discover_view_model.dart';
import 'package:shoes_ecommerce_app/model/product_model.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_radio.dart';
import 'package:shoes_ecommerce_app/view/widgets/filter_bottom_sheet.dart';
import 'package:shoes_ecommerce_app/view/widgets/price_card.dart';

class DiscoverView extends GetWidget<DiscoverViewModel> {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirestoreService().getAllCategories(),
          builder: (context, AsyncSnapshot<List<String>> categoriesSnapshot) {
            if (categoriesSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GetBuilder<DiscoverViewModel>(builder: (ctr) {
                ctr.setSelectedCategory(categoriesSnapshot.data!.first);
                return FutureBuilder(
                    future: FirestoreService()
                        .getProductsWithCategory(ctr.selectedCategory),
                    builder: (context,
                        AsyncSnapshot<List<ProductModel>> productsSnapshot) {
                      print(productsSnapshot.connectionState);
                      if (productsSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(
                                          FilterBottomSheet(),
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                        );
                                      },
                                      icon:
                                          Icon(Icons.widgets_rounded, size: 30),
                                    ),
                                    Image.asset(
                                      "assets/images/comLogo.png",
                                      height: 40,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Discover",
                                        style: Get.theme.textTheme.headline1,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Get the best sneakers here",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 22),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Search your favourites",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none,
                                          ),
                                          prefixIcon: Icon(Icons.search),
                                        ),
                                        // style: TextStyle(color: Get.theme.primaryColor),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.mediaQuery.size.width,
                                height: 40,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  itemBuilder: (context, index) {
                                    return CustomRadio(
                                      value: categoriesSnapshot.data![index],
                                      groupValue: ctr.selectedCategory,
                                      onChanged: (val) {
                                        print(ctr.selectedCategory);
                                        ctr.setSelectedCategory(val);
                                      },
                                    );
                                  },
                                  itemCount: categoriesSnapshot.data!.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              SizedBox(height: 20),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1 / 1.5,
                                ),
                                itemBuilder: (ctx, index) {
                                  return PriceCard(
                                    ProductModel(
                                      id: "ksdjfeifjsdf",
                                      name: "Nike Air Hyperfuse",
                                      description:
                                          "Nike Air Hyperfuse good something herees dsfhef sdfjeofmsdfef",
                                      category: "nike",
                                      image:
                                          "https://www.pngall.com/wp-content/uploads/2/Sneakers-PNG-HD-Image.png",
                                      price: 29.99,
                                      wishlists: 230,
                                      sizes: [9, 10, 11],
                                      // reviews: [
                                      //   ReviewModel(
                                      //     description: "good nike hyperfuse i like it actually",
                                      //     reviewer: "skfiefjisdjfief",
                                      //     rate: 4.5,
                                      //     timeReviewed: Timestamp.now(),
                                      //   ),
                                      // ],
                                      rate: 4.5,
                                    ),
                                  );
                                },
                                itemCount: productsSnapshot.data!.length,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        );
                      }
                    });
              });
            }
          }),
    );
  }
}
