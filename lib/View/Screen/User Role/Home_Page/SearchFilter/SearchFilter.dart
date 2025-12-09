import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../../../../../core/App_Routes/app_routes.dart';
import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../../Widgegt/Custom_Button/custom_button.dart';
import '../../../../Widgegt/Email_Input_Field/EmailInputField.dart';
import '../../../../Widgegt/FilterSliderSection/FilterSliderSection.dart';
import '../../../Choose_Language/choose_language.dart';
import '../ElectricianProviders/ElectricianProviders.dart';

class Searchfilter extends StatefulWidget {
  const Searchfilter({super.key});

  @override
  State<Searchfilter> createState() => _SearchfilterState();
}

class _SearchfilterState extends State<Searchfilter> {
  bool isUserSelected = true;
  TimeOfDay fromTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay toTime = TimeOfDay(hour: 13, minute: 0);
  DateTime? selectedDate;

  double rating = 2.5;
  double price = 250;
  double radius = 5;

  String selected = "ALL";
  final List<String> items = [
    "ALL",
    "wiring",
    "repairs",
    "emergency",
    "installations",
  ];

  get worker => null;

  Future<void> pickTime(bool isFrom) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isFrom ? fromTime : toTime,
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromTime = picked;
        } else {
          toTime = picked;
        }
      });
    }
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        title: Text(
          AppString.searchFilter,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22.sp),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),

      /// 👉 Whole body scrollable
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔎 TEXT FIELD
                CustomTextField(
                  label: AppString.serviceType,
                  hint: AppString.electrician,
                  img: AppImg.searchIcon,
                ),
                SizedBox(height: 16.h),

                /// 🔧 SERVICE TYPE CHIPS
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: items.map((item) {
                    bool isActive = selected == item;
                    return GestureDetector(
                      onTap: () => setState(() => selected = item),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFFFF6F4E)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color:
                                isActive ? Colors.white : Colors.grey.shade700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20.h),

                /// 🌍 LANGUAGE SELECTION
                const ChooseLanguage(),

                SizedBox(height: 20.h),

                /// ⏰ SERVICE TIMING
                Text(
                  AppString.serviceTiming.tr,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("From"), Text("To")],
                ),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => pickTime(true),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.red601),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            fromTime.format(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => pickTime(false),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.red601),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            toTime.format(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                /// 📅 DATE PICKER
                GestureDetector(
                  onTap: pickDate,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.red601),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate != null
                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                              : AppString.selectDateOfBirth,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Icon(Icons.calendar_today,
                            size: 20.sp, color: Colors.grey.shade600),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                FilterSliderSection(),

                SizedBox(
                  height: 10.h,
                ),

                CustomTextField(
                    label: "Search using Postal code", hint: "1082MD"),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      height: 47.h,
                      width: 153.w,
                      BoxDecoration: BoxDecoration(
                        color: isUserSelected
                            ? AppColors.red601
                            : Color(0xffFFEFEB),
                        border: Border.all(color: AppColors.red601, width: 1.w),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          AppString.clearAll.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: isUserSelected
                                ? AppColors.FFFFFF
                                : AppColors.black900,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isUserSelected = true;
                        });
                      },
                    ),
                    SizedBox(width: 8.w),
                    CustomButton(
                      height: 47.h,
                      width: 153.w,
                      BoxDecoration: BoxDecoration(
                        color: !isUserSelected
                            ? AppColors.red601
                            : Color(0xffFFEFEB),
                        border: Border.all(color: AppColors.red601, width: 1.w),
                        //color: AppColors.red601,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          AppString.applyFilters.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: isUserSelected
                                ? AppColors.black900
                                : AppColors.FFFFFF,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isUserSelected = false;
                        });
                        Get.toNamed(AppRoute.electricianproviders);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
    );
  }
}
