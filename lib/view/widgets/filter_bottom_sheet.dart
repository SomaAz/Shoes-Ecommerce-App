import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_button.dart';

class FilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.mediaQuery.size.height * .75,
      padding: const EdgeInsets.only(
        top: 25,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Filter",
              style: Get.textTheme.headline1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 25),
          buildSubtitleText("Price"),
          SizedBox(height: 10),
          RangeSlider(
            values: RangeValues(0, 60),
            onChanged: (values) {},
            labels: RangeLabels("\$0", "\$30"),
            min: 0,
            max: 100,
          ),
          SizedBox(height: 30),
          buildSubtitleText("Color"),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
                buildColorCircle(),
              ],
            ),
          ),
          SizedBox(height: 30),
          buildSubtitleText("Size"),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildSizeChip(isSelected: false),
                buildSizeChip(isSelected: false),
                buildSizeChip(isSelected: true),
                buildSizeChip(isSelected: false),
                buildSizeChip(isSelected: false),
                buildSizeChip(isSelected: false),
                buildSizeChip(isSelected: false),
              ],
            ),
          ),
          SizedBox(height: 40),
          CustomButton(onPressed: () {}, text: "Apply Filter")
        ],
      ),
    );
  }

  Widget buildSizeChip({
    int size = 9,
    required bool isSelected,
  }) {
    return SizedBox(
      width: Get.mediaQuery.size.width * .18,
      height: Get.mediaQuery.size.width * .18,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 1,
          color: isSelected ? accentColor : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                size.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildColorCircle() {
  return Container(
    width: Get.mediaQuery.size.width * .09,
    height: Get.mediaQuery.size.width * .09,
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.green,
    ),
  );
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
