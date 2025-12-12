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
import '../../../Widgegt/CustomCheckbox/CustomCheckbox.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
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
            child: CustomTextFieldE(hint: "Email", icon: Icons.email_outlined),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomCheckbox(
                      value: isChecked,
                      onChanged: (v) {
                        setState(() {
                          isChecked = v!;
                        });
                      },
                    ),
                    SizedBox(width: 18.w),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              AppString.Bycreating1.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Color(0xff1F2937),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              AppString.Terms.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Color(0xff3A7DFF),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 75.w),
                          child: Row(
                            children: [
                              Text(
                                AppString.Conditions.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Color(0xff3A7DFF),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                AppString.Bycreating2.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Color(0xff1F2937),
                                ),
                              ),

                              SizedBox(width: 8.w),
                              Text(
                                AppString.PrivacyPolicy.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Color(0xff3A7DFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          CustomButton(
            height: 56.h,
            width: 353.w,
            BoxDecoration: BoxDecoration(
              color: AppColors.red601,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                AppString.VerifyEmail.tr,
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
          // SizedBox(height: 10),
          // GestureDetector(
          //     onTap: (){
          //       Get.toNamed(AppRoute.signUpPhone);
          //     },
          //     child: Text("Phone")),


          SizedBox(height: 293.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.already.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray,
                ),
              ),
              SizedBox(width: 4.w),
              GestureDetector(
                onTap: () async {
                  await Future.delayed(Duration(milliseconds: 50));
                  Get.toNamed(AppRoute.signinwithbiometrics);
                },
                child: Text(
                  AppString.signIn.tr,
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
    );
  }
}
