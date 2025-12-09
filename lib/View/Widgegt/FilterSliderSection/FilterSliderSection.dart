import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'FilterController.dart';

class FilterSliderSection extends StatelessWidget {
  final FilterController controller = Get.put(FilterController());

  FilterSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double getFontSize(double size) => size * screenWidth / 375;
    double getIconSize(double size) => size * screenWidth / 375;
    double getSpacing(double size) => size * screenHeight / 812;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ======== Rating ==========
        Text(
          "Rating",
          style: TextStyle(
            fontSize: getFontSize(16),
            fontWeight: FontWeight.w600,
            color: Color(0xff4C545F),
          ),
        ),
        SizedBox(height: getSpacing(5)),

        // Rating labels
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.star, size: getIconSize(16), color: Color(0xff4C545F)),
                Text(" ${controller.ratingRange.value.start.toStringAsFixed(1)}",
                    style: TextStyle(fontSize: getFontSize(14), color: Color(0xff4C545F))),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star, size: getIconSize(16), color: Color(0xff4C545F)),
                Text(" ${controller.ratingRange.value.end.toStringAsFixed(1)}",
                    style: TextStyle(fontSize: getFontSize(14), color: Color(0xff4C545F))),
              ],
            ),
          ],
        )),

        // Rating slider
        Obx(() => RangeSlider(
          min: 0,
          max: 5,
          divisions: 100,
          activeColor: Color(0xff4C545F),
          values: controller.ratingRange.value,
          onChanged: (val) {
            controller.ratingRange.value = val;
          },
        )),

        /// ======== Price ==========
        SizedBox(height: getSpacing(10)),
        Text(
          "Pricing",
          style: TextStyle(
            fontSize: getFontSize(16),
            fontWeight: FontWeight.w600,
            color: Color(0xff4C545F),
          ),
        ),
        SizedBox(height: getSpacing(5)),

        // Price labels
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${controller.priceRange.value.start.toStringAsFixed(0)}",
                style: TextStyle(fontSize: getFontSize(14), color: Color(0xff4C545F))),
            Text("\$${controller.priceRange.value.end.toStringAsFixed(0)}",
                style: TextStyle(fontSize: getFontSize(14), color: Color(0xff4C545F))),
          ],
        )),

        // Price slider
        Obx(() => RangeSlider(
          min: 10,
          max: 500,
          divisions: 100,
          activeColor: Color(0xff4C545F),
          values: controller.priceRange.value,
          onChanged: (val) {
            controller.priceRange.value = val;
          },
        )),

        /// ======== Radius ==========
        SizedBox(height: getSpacing(10)),
        Text(
          "Location",
          style: TextStyle(
            fontSize: getFontSize(16),
            fontWeight: FontWeight.w600,
            color: Color(0xff4C545F),
          ),
        ),
        SizedBox(height: getSpacing(5)),

// Radius labels (dynamic)
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${controller.radius.value.start.toStringAsFixed(0)} km",
                style: TextStyle(fontSize: getFontSize(14), color: Color(0xff4C545F))),
            Text("${controller.radius.value.end.toStringAsFixed(0)} km",
                style: TextStyle(fontSize: getFontSize(14), color: Color(0xff4C545F))),
          ],
        )),

// Radius RangeSlider
        Obx(() => RangeSlider(
          min: 0,
          max: 5,
          divisions: 100,
          values: controller.radius.value,
          activeColor: Color(0xff4C545F),
          onChanged: (val) {
            controller.radius.value = val;
          },
        )),



      ],
    );
  }
}
