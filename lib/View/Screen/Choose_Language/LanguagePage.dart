import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/View/Screen/Choose_Language/choose_language.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppImg/app_img.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../../core/App_Routes/app_routes.dart';
import '../../Widgegt/Custom_Button/custom_button.dart';

class Languagepage extends StatefulWidget {
  const Languagepage({super.key});

  @override
  State<Languagepage> createState() => _LanguagepageState();
}

class _LanguagepageState extends State<Languagepage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            SizedBox(height: 128.h),

            Center(
              child: Image.asset(
                AppImg.image15,
                height: 120.h,
                width: 120.w,
              ),
            ),

            SizedBox(height: 30.h),

            /// LANGUAGE SELECTOR (Use Flexible, not Expanded)
            Expanded(child: ChooseLanguage()),


            Padding(
              padding:  EdgeInsets.only(bottom: 200.h),
              child: CustomButton(
                onTap: () {
                  Get.toNamed(AppRoute.signAsScreen);
                  if (isExpanded) {
                    setState(() => isExpanded = false);
                  }
                },
                height: 40.h,
                width: 167.w,
                BoxDecoration: BoxDecoration(
                  color: AppColors.red601,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    AppString.next,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.FFFFFF,
                    ),
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
