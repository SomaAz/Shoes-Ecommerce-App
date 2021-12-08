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
            return GetBuilder<DiscoverViewModel>(
              builder: (_) {
                controller.initSelectedCategory(categoriesSnapshot.data!.first);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await Get.bottomSheet(
                                  FilterBottomSheet(
                                    priceRange: controller.priceRange,
                                    size: controller.size,
                                  ),
                                  // isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      controller.setPriceRangeAndSize(
                                        value['priceRange'],
                                        value['size'],
                                      );
                                    }
                                  },
                                );
                              },
                              icon: Icon(Icons.widgets_rounded, size: 30),
                            ),
                            Image.asset(
                              "assets/images/comLogo.png",
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onChanged: (val) {
                                  controller.setSearch(val);
                                },
                                // style: TextStyle(color: Get.theme.primaryColor),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.mediaQuery.size.width,
                        height: 45,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          itemBuilder: (context, index) {
                            return CustomRadio.categories(
                              value: categoriesSnapshot.data![index].toString(),
                              groupValue:
                                  controller.selectedCategory.toString(),
                              onChanged: (val) {
                                controller.setSelectedCategory(val.toString());
                              },
                            );
                          },
                          itemCount: categoriesSnapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(height: 20),
                      FutureBuilder(
                        future: FirestoreService().getProductsWithCategory(
                            controller.selectedCategory),
                        builder: (context,
                            AsyncSnapshot<List<ProductModel>>
                                productsSnapshot) {
                          if (productsSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              heightFactor: 10,
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            if (productsSnapshot.data!.isEmpty) {
                              return Center(
                                heightFactor: 15,
                                child: Text(
                                  "There is no Products in ${controller.selectedCategory} Category",
                                  style: Get.textTheme.headline4!
                                      .copyWith(color: Colors.grey[800]),
                                ),
                              );
                            } else {
                              List<ProductModel> products = productsSnapshot
                                  .data!
                                  .where(
                                    (product) =>
                                        product.name.toLowerCase().contains(
                                              controller.search.toLowerCase(),
                                            ),
                                  )
                                  .toList();

                              if (controller.isFiltered) {
                                products = products
                                    .where(
                                      (product) => ((product.price >
                                              controller.priceRange.start &&
                                          product.price <
                                              controller.priceRange.end)),
                                    )
                                    .toList();
                                if (controller.size != 0) {
                                  products = products
                                      .where(
                                        (product) => (product.sizes
                                            .contains(controller.size)),
                                      )
                                      .toList();
                                }
                              }
                              return GridView.builder(
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
                                    products[index],
                                  );
                                },
                                itemCount: products.length,
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
