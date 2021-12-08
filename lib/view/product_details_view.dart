import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';
import 'package:shoes_ecommerce_app/model/product_model.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_button.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_radio.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
            ],
            expandedHeight: Get.mediaQuery.size.height * .42,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(product.image),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          // SizedBox(height: 400),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        // spreadRadius: 10,
                        color: Colors.grey,
                        // color: Colors.red,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style: Get.textTheme.headline1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow[700],
                                  size: 30,
                                ),
                                Text(
                                  product.rate.toString(),
                                  style: Get.textTheme.headline2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "\$${product.price}",
                            style: Get.textTheme.headline2!
                                .copyWith(color: accentColor),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            product.description,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Select a Size",
                            style: Get.textTheme.headline3,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: Get.mediaQuery.size.width * .18,
                          width: Get.mediaQuery.size.width,
                          child: ListView.builder(
                            // padding: EdgeInsets.symmetric(horizontal: 15),
                            itemBuilder: (context, index) {
                              return CustomRadio.sizes(
                                value: product.sizes[index],
                                groupValue: 10,
                                onChanged: (val) {},
                              );
                            },
                            itemCount: product.sizes.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          onPressed: () {},
                          text: "Add to bag",
                          icon: Icon(Icons.shopping_bag_rounded),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
