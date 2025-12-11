

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProviderHomeController extends GetxController {
  var searchController = TextEditingController();
  var name = "Sakil".obs;
  var notificationCount = 3.obs;
}