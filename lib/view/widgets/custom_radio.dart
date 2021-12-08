import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final void Function(T) onChanged;
  final Widget _widget;
  CustomRadio.categories({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : _widget = SizedBox(
          width: Get.mediaQuery.size.width * .29,
          child: GestureDetector(
            onTap: () => onChanged(value),
            child: Card(
              elevation: .5,

              color: groupValue == value ? accentColor : Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              // color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6,
                ),
                child: Center(
                  child: Text(
                    value
                        .toString()
                        .replaceRange(0, 1, value.toString()[0].toUpperCase()),
                    style: TextStyle(
                      color:
                          groupValue == value ? Colors.white : Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

  CustomRadio.sizes({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : _widget = SizedBox(
          width: Get.mediaQuery.size.width * .18,
          height: Get.mediaQuery.size.width * .18,
          child: GestureDetector(
            onTap: () => onChanged(value),
            child: Card(
              elevation: 1,
              color: value == groupValue ? accentColor : Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              // color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color:
                          value == groupValue ? Colors.white : Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}
