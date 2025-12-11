import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import 'EditProfileController.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _inputLabel("Name"),
            _inputField(controller.nameController),

            SizedBox(height: 15.h),
            _inputLabel("Email"),
            _inputField(controller.emailController,
                keyboardType: TextInputType.emailAddress),

            SizedBox(height: 15.h),
            _inputLabel("Country"),
            _countryDropdown(),

            SizedBox(height: 15.h),
            _inputLabel("Phone number"),
            _phoneInput(),

            SizedBox(height: 15.h),
            _inputLabel("Address"),
            _inputField(controller.addressController),

            SizedBox(height: 15.h),
            _inputLabel("Bio"),
            _bioInput(),

            SizedBox(height: 25.h),
            _updateButton(),

            SizedBox(height: 20.h),
            Text(
              "We have sent a verification code to your email. Please check and enter the code here.",
              style: TextStyle(fontSize: 12.sp, color: Colors.black54),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
    );
  }

  // 🔹 Label
  Widget _inputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        label,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  // 🔹 Normal Input Field
  Widget _inputField(TextEditingController textController,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: textController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.orange, width: 1.5.w),
        ),
      ),
    );
  }

  // 🔹 Country Dropdown
  Widget _countryDropdown() {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          alignment: Alignment.centerLeft,
          isExpanded: true,
          value: controller.selectedCountry.value,
          items: const [
            DropdownMenuItem(value: "Netherland", child: Text("Netherland")),
            DropdownMenuItem(value: "Germany", child: Text("Germany")),
            DropdownMenuItem(value: "Belgium", child: Text("Belgium")),
          ],
          onChanged: (value) {
            controller.selectedCountry.value = value!;
            controller.phoneCode.value = controller.countryCodes[value]!;
            controller.selectedFlag.value = controller.countryFlags[value]!;
          },
        ),
      ),
    ));
  }

  // 🔹 Phone Number Input
  Widget _phoneInput() {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          // Flag of country
          Text(controller.selectedFlag.value, style: TextStyle(fontSize: 18.sp)),
          SizedBox(width: 10.w),
          Text(controller.phoneCode.value, style: TextStyle(fontSize: 14.sp)),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    ));
  }

  // 🔹 Bio Input
  Widget _bioInput() {
    return TextField(
      controller: controller.bioController,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: "Tell more about yourself",
        hintStyle: TextStyle(fontSize: 13.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  // 🔹 Update Button
  Widget _updateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.updateProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5A36),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          "Update",
          style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
