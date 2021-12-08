import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';
import 'package:shoes_ecommerce_app/model/product_model.dart';
import 'package:shoes_ecommerce_app/view/product_details_view.dart';

class PriceCard extends StatelessWidget {
  final ProductModel product;
  const PriceCard(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsView(product));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text(
                    "\$${product.price}",
                    style:
                        Get.textTheme.headline3!.copyWith(color: accentColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FadeInImage(
                  image: NetworkImage(
                    product.image,
                  ),
                  placeholder: AssetImage(
                    "assets/images/loading.gif",
                  ),
                  // height: Get.mediaQuery.size.height * .28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
