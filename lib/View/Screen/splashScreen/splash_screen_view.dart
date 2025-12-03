import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../helper/Shared_prefe/shared_prefe.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  @override
  void initState() {
    super.initState();
    _checkIfGetStartedClicked();
  }

  void _checkIfGetStartedClicked() async {
    String isClicked =
    await SharePrefsHelper.getString("isGetStartedClicked");
    if (isClicked == "true") {
      // If already clicked, navigate directly to next page
      Get.offNamed(AppRoute.chooseLanguage); // or your home route
    }
  }

  void _onGetStarted() async {
    // Save that user clicked the button
    await SharePrefsHelper.setString("isGetStartedClicked", "true");

    // Navigate to next screen
    Get.toNamed(AppRoute.chooseLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 232.h),
              child: Container(
                height: 164.h,
                width: 353.w,
                child: Column(
                  children: [
                    Image.asset(AppImg.image15, height: 120.h, width: 120.w),
                    Text(
                      AppString.txmeRecaim,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black800,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 42.h),
            CustomButton(
              onTap: _onGetStarted,
              height: 40.h,
              width: 167.w,
              BoxDecoration: BoxDecoration(
                  color: AppColors.red601,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Center(
                child: Text(
                  AppString.getStarted,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.FFFFFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
