import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';

class Signinwithbiometrics extends StatefulWidget {
  const Signinwithbiometrics({super.key});

  @override
  State<Signinwithbiometrics> createState() => _SigninwithbiometricsState();
}

class _SigninwithbiometricsState extends State<Signinwithbiometrics> {
  bool isUserSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,

      // appBar: AppBar(
      //   backgroundColor: AppColors.FFFFFF,
      //   title:  Center(
      //     child: Text(
      //       AppString.signIn.tr,
      //       style: TextStyle(
      //         fontSize: 18.sp,
      //         fontWeight: FontWeight.w400,
      //         color: AppColors.gray,
      //       ),
      //     ),
      //   ),
      // ),

      body: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 62.h),
              child: Center(
                child: Text(
                  AppString.signIn.tr,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
            SizedBox(height: 92.h),
            Image.asset(AppImg.image15, height: 120.h, width: 120.w),
            Padding(
              padding: EdgeInsets.only(right: 56.w, left: 55.h),
              child: Text(
                AppString.readytosignin.tr,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 18.h),
            CustomButton(
              height: 52.h,
              width: 352.w,
              BoxDecoration: BoxDecoration(
                color: isUserSelected ? AppColors.red601 : Colors.transparent,
                border: Border.all(color: AppColors.red601, width: 1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.fingerPrint,
                    color: isUserSelected
                        ? AppColors.FFFFFF
                        : AppColors.black900,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    AppString.signInWithBiometrics.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: isUserSelected
                          ? AppColors.FFFFFF
                          : AppColors.black900,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  isUserSelected = true;
                });
              },
            ),
            SizedBox(height: 16.h),
            CustomButton(
              height: 52.h,
              width: 352.w,
              BoxDecoration: BoxDecoration(
                color: !isUserSelected ? AppColors.red601 : Colors.transparent,
                border: Border.all(color: AppColors.red601, width: 1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.lockClosed,
                    color: isUserSelected
                        ? AppColors.black900
                        : AppColors.FFFFFF,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    AppString.GetSignincodeviaEmail.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: isUserSelected
                          ? AppColors.black900
                          : AppColors.FFFFFF,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  isUserSelected = false;
                });
              },
            ),
            SizedBox(height: 30.h),
            Text(
              AppString.NoPasswordRequired.tr,
              style: TextStyle(
                color: AppColors.black900,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
                SizedBox(height: 177.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString.Donthaveanaccount.tr, style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.gray
                ),),
                Text(AppString.signUn, style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.A7DFF
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
