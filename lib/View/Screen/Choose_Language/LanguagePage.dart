import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppImg/app_img.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../../core/App_Routes/app_routes.dart';
import '../../Widgegt/Custom_Button/custom_button.dart';
import 'choose_language.dart';

class Languagepage extends StatelessWidget {
  const Languagepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(   // 👈 Scroll added
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                SizedBox(height: 100.h),

                Center(
                  child: Image.asset(
                    AppImg.image15,
                    height: 120.h,
                    width: 120.w,
                  ),
                ),

                SizedBox(height: 30.h),

                /// Language Selector
                const ChooseLanguage(),

                SizedBox(height: 50.h),

                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoute.signAsScreen);
                  },
                  height: 45.h,
                  width: 180.w,
                  BoxDecoration: BoxDecoration(
                    color: AppColors.red601,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      AppString.next,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.FFFFFF,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
