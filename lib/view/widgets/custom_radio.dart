import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';

class CustomRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String) onChanged;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.mediaQuery.size.width * .29,
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Card(
          elevation: .5,

          color: groupValue == value ? accentColor : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6,
            ),
            child: Center(
              child: Text(
                value.replaceRange(0, 1, value[0].toUpperCase()),
                style: TextStyle(
                  color: groupValue == value ? Colors.white : Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
