import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FilterController extends GetxController {
  Rx<RangeValues> ratingRange = const RangeValues(0.0, 5.0).obs;
  Rx<RangeValues> priceRange = const RangeValues(10.0, 500.0).obs;

  // Radius as RangeValues for 2-handle slider
  Rx<RangeValues> radius = const RangeValues(0.0, 5.0).obs; // ← must be RangeValues
}
