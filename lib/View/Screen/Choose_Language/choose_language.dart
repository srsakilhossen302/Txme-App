import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppImg/app_img.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../../core/App_Routes/app_routes.dart';
import '../../Widgegt/Custom_Button/custom_button.dart';
import 'LanguageController.dart';


class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  bool isExpanded = false;

  final LanguageController languageController = Get.put(LanguageController());

  String selectedLang = "English";

  List<String> languages = [
    "English",
    "German",
    "Dutch",
    "French",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 128.h),
              child: Center(
                child: Image.asset(
                  AppImg.image15,
                  height: 120.h,
                  width: 120.w,
                ),
              ),
            ),

            SizedBox(height: 30.h),

            /// LANGUAGE SELECTOR
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppString.chooseLanguage,
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.red601,
                    width: 1.4,
                  ),
                  color: const Color(0xffF7F7F7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedLang,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),

            if (isExpanded)
              Container(
                margin: EdgeInsets.only(top: 5.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: languages
                      .where((e) => e != selectedLang)
                      .map(
                        (lang) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLang = lang;
                          isExpanded = false;
                        });
                        languageController.changeLanguage(lang);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(lang),
                            const Icon(
                              Icons.keyboard_arrow_up,
                              size: 18,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),

            SizedBox(height: 40.h),

            CustomButton(
              onTap: () {
                // Next page e navigate korar example
                 Get.toNamed(AppRoute.signAsScreen);
                // Ba just close dropdown if open
                if (isExpanded) {
                  setState(() {
                    isExpanded = false;
                  });
                }
              },
              height: 40.h,
              width: 167.w,
              BoxDecoration: BoxDecoration(
                  color: AppColors.red601,
                  borderRadius: BorderRadius.circular(12.r)),
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
    );
  }
}
