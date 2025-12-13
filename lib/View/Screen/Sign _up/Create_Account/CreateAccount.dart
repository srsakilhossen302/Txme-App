// lib/screens/create_account_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/View/Widgegt/Email_Input_Field/CustomTextField.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';
import 'AccountController.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isUserSelected = true;
  final AccountController c = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
        title:  Text(
          AppString.CreateAccount,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
             SizedBox(height: 20.h),


            GestureDetector(
              onTap: c.openCamera,
              child: Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 83.2.w,
                      height: 83.2.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.red601, width: 2),
                      ),
                    ),
                    Container(
                      width: 96.w,
                      height: 96.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.red601, width: 2.w),
                      ),
                    ),
                    Container(
                      width: 110.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: c.profileImage.value != null
                            ? DecorationImage(
                                image: FileImage(c.profileImage.value!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: c.profileImage.value == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 44,
                              color: AppColors.red601,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 12.h),
             Text(
              AppString.openYourCamera.tr,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

             SizedBox(height: 50.h),
            CustomTextFieldC(
              border:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.red601),
              ),
              controller: c.nameController,
              color: Colors.grey.shade50,
              readOnly: false,
              hintText: AppString.name.tr,
              onTap: () {

              },
              label: AppString.fullName.tr,
            ),

             SizedBox(height: 20.h),

            CustomTextFieldC(
              border:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.red601),
              ),
              controller: c.dobController,
              color: Colors.grey.shade50,
              readOnly: true,
              onTap: c.selectDate,
              hintText: AppString.selectDateOfBirth.tr,
              label: AppString.dateOfBirth.tr,
              suffixIcon: const Icon(
                Icons.calendar_today,
                color: AppColors.red601,
              ),
            ),

             SizedBox(height: 20.h),

            Obx(() {
              // Observing selectedGender and updating the hintText reactively
              return CustomTextFieldC(
                border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.red601),
                ),
                controller: c.genderController,
                color: Colors.grey.shade50,

                readOnly: true, // Make the Gender field read-only
                onTap: () =>
                    c.selectGender(context), // Trigger gender selection dialog
                hintText:
                    c.selectedGender.value ??
                    AppString.SelectGender.tr, // Default hint text
                label: AppString.Gender.tr,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.red601,
                ), // Optional down-arrow icon
              );
            }),
             SizedBox(height: 20.h),
            CustomTextFieldC(
              controller: c.nameController,
              color: Colors.grey.shade50,

              border:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.red601),
              ),
              readOnly: false,
              hintText: AppString.enterNationality.tr,
              onTap: () {
              },
              label:  AppString.Nationality.tr,
            ),
             SizedBox(height: 20.h),

            Obx(() {
              // Observing selectedGender and updating the hintText reactively
              return CustomTextFieldC(
                controller: c.residenceController,
                color: Colors.grey.shade50,

                border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.red601),
                ),
                readOnly: true, // Make the Gender field read-only
                onTap: () => c.selectResidence(
                  context,
                ), // Trigger gender selection dialog
                hintText:
                    c.selectedResidence.value ??
                    AppString.selectResidence.tr, // Default hint text
                label: AppString.countryResidence.tr,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color:AppColors.red601,
                ), // Optional down-arrow icon
              );
            }),
             SizedBox(height: 20.h),

            CustomTextFieldC(
              controller: c.nameController,
              color: Colors.grey.shade50,

              border:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.red601),
              ),
              readOnly: false,
              hintText: AppString.fullAddress.tr,
              onTap: () {
              },
              label:  AppString.residentialAddress.tr,
            ),
             SizedBox(height: 20.h),
            CustomTextFieldC(
              controller: c.nameController,
              color: Colors.grey.shade50,

              border:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.red601),
              ),
              readOnly: false,
              hintText: AppString.postalAddress.tr,
              onTap: () {
              },
              label: AppString.postal.tr,
            ),
             SizedBox(height: 20.h),

            Obx(() {
              // Observing selectedGender and updating the hintText reactively
              return CustomTextFieldC(
                controller: c.iDController,
                color: Colors.grey.shade50,

                border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.red601),
                ),
                readOnly: true, // Make the Gender field read-only
                onTap: () =>
                    c.selectID(context), // Trigger gender selection dialog
                hintText:
                    c.selectedID.value ?? AppString.selectID.tr, // Default hint text
                label: AppString.selectYourID.tr,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.red601,
                ), // Optional down-arrow icon
              );
            }),
             SizedBox(height: 20.h),

            CustomTextFieldC(
              controller: c.nameController,
              color: Colors.grey.shade50,

              border:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.red601),
              ),
              readOnly: false,
              hintText: AppString.inputIdNumber.tr,
              onTap: () {

              },
              label: AppString.iDNumber.tr,
            ),
             SizedBox(height: 20.h),

            Obx(() {
              // Observing selectedGender and updating the hintText reactively
              return CustomTextFieldC(
                controller: c.maritalController,
                color: Colors.grey.shade50,

                border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.red601),
                ),
                readOnly: true, // Make the Gender field read-only
                onTap: () =>
                    c.selectMarital(context), // Trigger gender selection dialog
                hintText:
                    c.selectedMarital.value ??
                    AppString.selectMarital.tr, // Default hint text
                label: AppString.maritalStatus.tr,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.red601,
                ), // Optional down-arrow icon
              );
            }),
             SizedBox(height: 40.h),
            Row(
              children: [
                CustomButton(
                  height: 56.h,
                  width: 165.w,
                  BoxDecoration: BoxDecoration(
                    color: isUserSelected
                        ? AppColors.red601
                        : Colors.transparent,
                    border: Border.all(color: AppColors.red601, width: 1.w),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      AppString.Help.tr,
                      style: TextStyle(
                        color: isUserSelected
                            ? AppColors.FFFFFF
                            : AppColors.black900,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isUserSelected = true;
                    });
                  },
                ),
                SizedBox(width: 15.w),
                CustomButton(
                  height: 56.h,
                  width: 165.w,
                  BoxDecoration: BoxDecoration(
                    color: !isUserSelected
                        ? AppColors.red601
                        : Colors.transparent,
                    border: Border.all(color: AppColors.red601, width: 1.w),
                    //color: AppColors.red601,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      AppString.next.tr,
                      style: TextStyle(
                        color: isUserSelected
                            ? AppColors.black900
                            : AppColors.FFFFFF,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isUserSelected = false;

                      Get.toNamed(AppRoute.faceIDSetupScreen);
                    });
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
