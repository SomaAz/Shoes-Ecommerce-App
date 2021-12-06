import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_button.dart';

class MyBagView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Bag",
                  style: Get.textTheme.headline1,
                ),
              ),
              SizedBox(height: 15),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        width: Get.mediaQuery.size.width * .3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FadeInImage(
                            image: NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/2/Sneakers-PNG-HD-Image.png",
                            ),
                            placeholder: AssetImage(
                              "assets/images/loading.gif",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Nike Air Diamond",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.headline3,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Size: 14",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Color: Red",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "\$29.99",
                                    style: Get.textTheme.headline3!
                                        .copyWith(color: accentColor),
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.remove_rounded,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "01",
                                        style: Get.textTheme.headline4,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.delete_outline_rounded),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 3,
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 13,
                      child: TextField(
                        expands: true,
                        maxLength: 30,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "Enter coupon Code",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,

                          // contentPadding: EdgeInsets.symmetric(vertical: 60),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 7,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text("Apply", style: TextStyle(fontSize: 16)),
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Get.theme.primaryColor,
                            ),
                            foregroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal", style: Get.textTheme.headline4),
                  Text("\$59.80", style: Get.textTheme.headline3),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery", style: Get.textTheme.headline4),
                  Text("\$5.00", style: Get.textTheme.headline3),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: Get.textTheme.headline3),
                  Text("\$64.80", style: Get.textTheme.headline2),
                ],
              ),
              SizedBox(height: 40),
              CustomButton(onPressed: () {}, text: "Proceed to checkout"),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}//59.80
