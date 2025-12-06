import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AccountController extends GetxController {
  // Observable variables
  var profileImage = Rxn<File>();
  var selectedDate = Rxn<DateTime>();
  var selectedGender = Rx<String?>(null);  // Initialize with null to show "Select Gender"
  var selectedResidence = Rx<String?>(null);
  var selectedID = Rx<String?>(null);
  var selectedMarital = Rx<String?>(null);
 // Observable for gender

  // Text Controllers
  var nameController = TextEditingController();
  var dobController = TextEditingController();
  var genderController = TextEditingController();   // Gender text controller
  var residenceController = TextEditingController();
  var iDController = TextEditingController();
  var maritalController = TextEditingController();

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
  Future<void> selectGender(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Gender'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Male");
            },
            child: Text("Male"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Female");
            },
            child: Text("Female"),
          ),
        ],
      ),
    );

    if (selected != null) {
      genderController.text = selected;  // Update the controller with selected gender
      selectedGender.value = selected;  // Update the Rx value
    }
  }

  Future<void> selectID(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select ID'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Passport");
            },
            child: Text("Passport"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "NID");
            },
            child: Text("NID"),
          ),
        ],
      ),
    );

    if (selected != null) {
      iDController.text = selected;  // Update the controller with selected gender
      selectedID.value = selected;  // Update the Rx value
    }
  }



  Future<void> selectResidence(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Gender'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Dhaka");
            },
            child: Text("Dhaka"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Chattogram");
            },
            child: Text("Chattogram"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Sylhet");
            },
            child: Text("Sylhet"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Rajshahi");
            },
            child: Text("Rajshahi"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Khulna");
            },
            child: Text("Khulna"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Barishal");
            },
            child: Text("Barishal"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Rangpur");
            },
            child: Text("Rangpur"),
          ),
        ],
      ),
    );

    if (selected != null) {
      residenceController.text = selected;  // Update the controller with selected gender
      selectedResidence.value = selected;  // Update the Rx value
    }
  }

  Future<void> selectMarital(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Marital'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Marital");
            },
            child: Text("Marital"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Unmarried");
            },
            child: Text("Unmarried"),
          ),
        ],
      ),
    );

    if (selected != null) {
      maritalController.text = selected;  // Update the controller with selected gender
      selectedMarital.value = selected;  // Update the Rx value
    }
  }



  @override
  void onClose() {
    nameController.dispose();
    dobController.dispose();
    genderController.dispose();
    residenceController.dispose();
    iDController.dispose();
    maritalController.dispose();
    super.onClose();
  }
}
