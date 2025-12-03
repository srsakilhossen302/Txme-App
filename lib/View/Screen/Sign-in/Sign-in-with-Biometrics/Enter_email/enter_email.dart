import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/View/Widgegt/Email_Input_Field/EmailInputField.dart';

class EnterEmail extends StatefulWidget {
  const EnterEmail({super.key});

  @override
  State<EnterEmail> createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 165.h),
              child: Image.asset(AppImg.image15, height: 120.h, width: 120.w),
            ),
          ),

          SizedBox(height: 121.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: CustomTextField(
              label: AppString.enterEmaily,
              hint: AppString.enterEmail,
            ),
          ),
          SizedBox(height: 30.h),

          CustomButton(
            height: 56.h,
            width: 353.w,
            BoxDecoration: BoxDecoration(
              color: AppColors.red601,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                AppString.next,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.FFFFFF,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
