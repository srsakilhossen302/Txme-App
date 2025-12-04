import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/View/Widgegt/Email_Input_Field/EmailTextFieldWidget.dart';
import '../../../../core/App_Routes/app_routes.dart';

class SignUpPhone extends StatefulWidget {
  const SignUpPhone({super.key});

  @override
  State<SignUpPhone> createState() => _SignUpPhoneState();
}

class _SignUpPhoneState extends State<SignUpPhone> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppString.signUn.tr,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black700,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Image.asset(AppImg.image15, height: 120.h, width: 120.w),
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomTextFieldE(hint: AppString.phone, icon: Icons.phone),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            height: 56.h,
            width: 353.w,
            BoxDecoration: BoxDecoration(
              color: AppColors.red601,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                AppString.verifyNumber.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.FFFFFF,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoute.verifyotppageS);
            },
          ),
        ],
      ),
    );
  }
}
