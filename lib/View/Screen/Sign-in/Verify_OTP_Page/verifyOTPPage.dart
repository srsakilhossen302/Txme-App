import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/OtpBoxes/OtpBoxes.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../core/App_Routes/app_routes.dart';
import '../../../Widgegt/Custom_Button/custom_button.dart';

class Verifyotppage extends StatefulWidget {
  const Verifyotppage({super.key});

  @override
  State<Verifyotppage> createState() => _VerifyotppageState();
}

class _VerifyotppageState extends State<Verifyotppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppString.verifyOTP.tr,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: AppColors.black900,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 36.h),
            child: Center(
                child: Image.asset(
                    AppImg.Data_security_27
                )
            ),
          ),
          SizedBox(height: 40.h,),
          Padding(
            padding:  EdgeInsets.only(right: 50.w, left: 50.w),
            child: Text(AppString.otpText.tr, style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black700
            ),),
          ),

          SizedBox(height: 15.h,),

          OtpBoxes(),

          SizedBox(height: 46.h),
          Padding(
            padding:  EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.receiveCode.tr, style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: AppColors.black700
                ),),
                Text(AppString.Resend.tr, style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.A7DFF
                ),),
              ],
            ),
          ),
          SizedBox(height: 46.h),
          CustomButton(
            height: 56.h,
            width: 353.w,
            BoxDecoration: BoxDecoration(
              color: AppColors.red601,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                AppString.Verify,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.FFFFFF,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoute.faceverificationdone);
            },
          ),
        ],
      ),
    );
  }
}
