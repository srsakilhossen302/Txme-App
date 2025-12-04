import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../../Utils/StaticString/static_string.dart';

class Verifyfingerprint extends StatefulWidget {
  const Verifyfingerprint({super.key});

  @override
  State<Verifyfingerprint> createState() => _VerifyfingerprintState();
}

class _VerifyfingerprintState extends State<Verifyfingerprint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        // backgroundColor: AppColors.gray,
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Text(
                AppString.signIn.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black900,
                ),
              ),
            ),
          ),
          SizedBox(height: 259.h),
          SvgPicture.asset(AppIcons.fingerPrint, height: 52.h, width: 52.w),

          SizedBox(height: 20),

          CustomButton(
            height: 44.h,
            width: 226.w,
            BoxDecoration: BoxDecoration(
              color: AppColors.red601,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                AppString.verifyFingerprint.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.FFFFFF,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoute.homepage);
            },
          ),
        ],
      ),
    );
  }
}
