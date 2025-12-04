// lib/controllers/account_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AccountController extends GetxController {
  // Observable variables
  var profileImage = Rxn<File>();
  var selectedDate = Rxn<DateTime>();

  // Text Controllers
  var nameController = TextEditingController();
  var dobController = TextEditingController();

  final picker = ImagePicker();

  // ক্যামেরা ওপেন করে ছবি তুলবে
  Future<void> openCamera() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (image != null) {
      profileImage.value = File(image.path);
    }
  }

  // ডেট পিকার দেখাবে
  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.orange),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
      dobController.text = DateFormat('dd MMMM yyyy').format(picked);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    dobController.dispose();
    super.onClose();
  }
}