import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final int wishlists;
  final int reviews;

  const ProductCard({
    required this.image,
    required this.name,
    required this.wishlists,
    required this.reviews,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.grey[50],
                  child: FadeInImage(
                    image: NetworkImage(
                      image,
                    ),
                    placeholder: AssetImage(
                      "assets/images/loading.gif",
                    ),
                    height: Get.mediaQuery.size.height * .28,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Get.textTheme.headline2,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(width: 2),
                            // RichText(
                            //   text: TextSpan(
                            //     children: [
                            //       TextSpan(
                            //         text: wishlists.toString(),
                            //         style: Get.textTheme.headline4,
                            //       ),
                            //       TextSpan(
                            //         text: " added to wishlist",
                            //         style: Get.textTheme.headline5,
                            //       )
                            //     ],
                            //   ),
                            // ),
                            Text(
                              "$wishlists added to wishlist",
                              style: Get.textTheme.headline4,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 60,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "$reviews Reviews",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            softWrap: false,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
