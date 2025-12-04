import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

class SigninWithBiometrics extends StatelessWidget {
  const SigninWithBiometrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),

                  /// Title
                  Text(
                    AppString.signIn.tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black900,
                    ),
                  ),

                  SizedBox(height: 70.h),

                  /// Top Image
                  Image.asset(
                    AppImg.image15,
                    height: 110.h,
                    width: 110.w,
                  ),

                  SizedBox(height: 20.h),

                  /// Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      AppString.readytosignin.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),

                  /// Fingerprint & Face ID Row
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          height: 52.h,
                          width: double.infinity,
                          BoxDecoration: BoxDecoration(
                            color: AppColors.red601,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.fingerPrint,
                                  color: Colors.white),
                              SizedBox(width: 6.w),
                              Text(
                                "Fingerprint",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            // small delay to prevent pointer conflicts on web
                            await Future.delayed(Duration(milliseconds: 50));
                            Get.toNamed(AppRoute.verifyfingerprint);
                          },
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomButton(
                          height: 52.h,
                          width: double.infinity,
                          BoxDecoration: BoxDecoration(
                            color: AppColors.red601,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.faceId,
                                  color: Colors.white),
                              SizedBox(width: 6.w),
                              Text(
                                "Face ID",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            await Future.delayed(Duration(milliseconds: 50));
                            Get.toNamed(AppRoute.verifyFaceId);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h),

                  /// OR Text
                  Text(
                    "Or",
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Email Sign-in Button (Outlined)
                  CustomButton(
                    height: 52.h,
                    width: double.infinity,
                    BoxDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: AppColors.red601, width: 1.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.lockClosed,
                            color: AppColors.black900),
                        SizedBox(width: 8.w),
                        Text(
                          AppString.GetSignincodeviaEmail.tr,
                          style: TextStyle(
                            color: AppColors.black900,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 50));
                      Get.toNamed(AppRoute.enterEmail);
                    },
                  ),

                  SizedBox(height: 250.h),

                  /// Sign Up Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.Donthaveanaccount.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      GestureDetector(
                        onTap: () async {
                          await Future.delayed(Duration(milliseconds: 50));
                          Get.toNamed(AppRoute.signUpEmail);
                        },
                        child: Text(
                          AppString.signUn.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.A7DFF,
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
