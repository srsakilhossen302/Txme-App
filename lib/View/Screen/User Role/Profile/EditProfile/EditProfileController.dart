import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // Text Controllers
  TextEditingController nameController = TextEditingController(text: "Kathrine Jose");
  TextEditingController emailController = TextEditingController(text: "kjose@gmail.com");
  TextEditingController addressController = TextEditingController(text: "Keizersgracht 123, Amsterdam");
  TextEditingController phoneController = TextEditingController(text: "20 123 4567");
  TextEditingController bioController = TextEditingController(text: "Tell more about yourself");

  // Country
  RxString selectedCountry = "Netherland".obs;

  // Country Code mapping
  Map<String, String> countryCodes = {
    "Netherland": "+31",
    "Germany": "+49",
    "Belgium": "+32",
  };

  // Country Flag mapping
  Map<String, String> countryFlags = {
    "Netherland": "🇳🇱",
    "Germany": "🇩🇪",
    "Belgium": "🇧🇪",
  };

  // Observable Phone Code
  RxString phoneCode = "+31".obs;

  // Observable Country Flag
  RxString selectedFlag = "🇳🇱".obs;

  @override
  void onInit() {
    super.onInit();
    phoneCode.value = countryCodes[selectedCountry.value]!;
    selectedFlag.value = countryFlags[selectedCountry.value]!;
  }

  // Update Profile Function (dummy)
  void updateProfile() {
    print("Profile Updated");
  }
}
