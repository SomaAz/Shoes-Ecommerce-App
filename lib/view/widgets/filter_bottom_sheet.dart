import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/controller/filter_bottom_sheet_controller.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_button.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_radio.dart';

class FilterBottomSheet extends StatelessWidget {
  final RangeValues priceRange;
  final int size;

  const FilterBottomSheet({
    required this.priceRange,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterBottomSheetController>(
        init: FilterBottomSheetController(priceRange, size),
        builder: (controller) {
          controller.initValues(priceRange, size);
          print(priceRange);
          return Container(
            // height: Get.mediaQuery.size.height * .6,
            padding: const EdgeInsets.only(
              top: 25,
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter",
                      style: Get.textTheme.headline1,
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      onPressed: () {
                        controller.setPriceRange(RangeValues(1, 100));
                        controller.setSelectedSize(0);
                      },
                      child: Text(
                        "clear",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red),
                        overlayColor: MaterialStateProperty.all(Colors.red[50]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                buildSubtitleText("Price"),
                SizedBox(height: 10),
                RangeSlider(
                  divisions: 1000,
                  values: controller.priceRange,
                  onChanged: (values) {
                    controller.setPriceRange(
                      RangeValues(
                        double.parse(values.start.toStringAsFixed(1)),
                        double.parse(values.end.toStringAsFixed(1)),
                      ),
                    );
                  },
                  labels: RangeLabels(
                    "\$${controller.priceRange.start}",
                    "\$${controller.priceRange.end}",
                  ),
                  min: 1,
                  max: 100,
                ),
                SizedBox(height: 30),
                // buildSubtitleText("Color"),
                // SizedBox(height: 10),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //       buildColorCircle(),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 30),
                buildSubtitleText("Size"),
                SizedBox(height: 10),
                SizedBox(
                  height: Get.mediaQuery.size.width * .18,
                  width: Get.mediaQuery.size.width,
                  child: ListView.builder(
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      return CustomRadio.sizes(
                        value: index + 8,
                        groupValue: controller.selectedSize,
                        onChanged: (val) {
                          controller.setSelectedSize(int.parse(val.toString()));
                        },
                      );
                    },
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 40),
                CustomButton(
                  onPressed: () {
                    Get.back(result: {
                      "priceRange": controller.priceRange,
                      "size": controller.selectedSize,
                    });
                  },
                  text: "Apply Filter",
                ),
              ],
            ),
          );
        });
  }

  Widget buildSubtitleText(text) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: Get.textTheme.headline3,
        textAlign: TextAlign.left,
      ),
    );
  }
}
