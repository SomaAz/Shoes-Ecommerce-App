import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/view/widgets/product_card.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "My Explores",
                  style: Get.theme.textTheme.headline1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductCard(
                    image:
                        "https://www.pngall.com/wp-content/uploads/2/Sneakers-PNG-HD-Image.png",
                    name: "Nike Air Max 270",
                    reviews: 754,
                    wishlists: 1156,
                  );
                },
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
