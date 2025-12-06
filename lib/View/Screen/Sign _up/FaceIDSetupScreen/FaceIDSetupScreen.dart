import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgegt/Custom_Button/custom_button.dart';
import 'FaceIDSetupController.dart'; // Import GetX for state management


class FaceIDSetupScreen extends StatelessWidget {
  final FaceIDSetupController controller = Get.put(FaceIDSetupController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppString.SetFaceID.tr)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back(); // Close the screen or navigate elsewhere
            },
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(

          children: [
            // Progress Indicator
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 2,
                    color: controller.currentStep.value == 2 ? Colors.blue : Colors.grey,
                  ),
                  CircleAvatar(
                    backgroundColor: controller.currentStep.value == 1 ? Colors.blue : Colors.grey,
                    radius: 15,
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  Container(
                    width: 120,
                    height: 2,
                    color: controller.currentStep.value == 2 ? Colors.blue : Colors.grey,
                  ),
                  CircleAvatar(
                    backgroundColor: controller.currentStep.value == 2 ? Colors.blue : Colors.grey,
                    radius: 15,
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 2,
                    color: controller.currentStep.value == 2 ? Colors.blue : Colors.grey,
                  ),
                ],
              );
            }),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 80.w),
                  child: Text(AppString.Registration.tr,  style: TextStyle(
                      color: Color(0xff535353),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500
                  ),),
                ),
                SizedBox(width: 110.w,),
                Text(AppString.FaceID,
                style: TextStyle(
                  color: Color(0xff535353),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500
                ),
                )
              ],
        ),
            SizedBox(height: 20.h),

            // Description
            Text(
              AppString.SecureOTPsignIn.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray700),
            ),
            SizedBox(height: 85.h),

            // Face ID Placeholder (or icon)
            GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.faceIDSetupScreen2);
                },
                child: Image.asset(AppImg.faceIdImg)),


            // Cancel Button
            SizedBox(height: 20.h),
            CustomButton(
              height: 56.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.red601, width: 1)
              ),
              child: Center(child: Text(AppString.Cancel.tr, style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.red601
              ),)),
              onTap: () {
                print("=======================>>>>>>>>>>>>>>>>>>>=====================");
                //Get.toNamed(AppRoute.signinwithbiometrics);
              },
            ),
          ],
        ),
      ),
    );
  }
}
