import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

class SignAsScreen extends StatefulWidget {
  const SignAsScreen({super.key});

  @override
  State<SignAsScreen> createState() => _SignAsScreenState();
}

class _SignAsScreenState extends State<SignAsScreen> {
  bool isUserSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 44.h),
              child: Container(
                width: double.infinity,
                height: 414.h,
                child: Image.asset(AppImg.splashscreen, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Image.asset(AppImg.image15, height: 110.h, width: 110.w),
            ),
            Center(
              child: Text(
                AppString.txmeRecaim.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
              ),
            ),
            Center(
              child: Text(
                AppString.joinasa.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  CustomButton(
                    height: 40.h,
                    width: 167.w,
                    BoxDecoration: BoxDecoration(
                      color: isUserSelected
                          ? AppColors.red601
                          : Colors.transparent,
                      border: Border.all(color: AppColors.red601, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        AppString.user.tr,
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
                  SizedBox(width: 19.w),
                  CustomButton(
                    height: 40.h,
                    width: 167.w,
                    BoxDecoration: BoxDecoration(
                      color: !isUserSelected
                          ? AppColors.red601
                          : Colors.transparent,
                      border: Border.all(color: AppColors.red601, width: 1),
                      //color: AppColors.red601,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        AppString.provider.tr,
                        style: TextStyle(
                          color: isUserSelected
                              ? AppColors.black900
                              : AppColors.FFFFFF,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoute.providerHomeScreen);
                      setState(() {
                        isUserSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              height: 56.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                color: AppColors.red601,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(child: Text(AppString.next.tr)),
              onTap: () {
                print("=======================>>>>>>>>>>>>>>>>>>>=====================");
                Get.toNamed(AppRoute.signinwithbiometrics);
              },
            ),
          ],
        ),
      ),
    );
  }
}
