import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
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

      /// FIX HERE: SCROLL ADDED + SAFE AREA
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LANGUAGE TITLE
          Text(
            AppString.chooseLanguage,
            style: TextStyle(
              color: AppColors.gray,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10.h),

          /// CONTAINER DROPDOWN
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.red601,
                  width: 1.4.w,
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

          /// DROPDOWN LIST
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

        ],
      ),
    );
  }
}
