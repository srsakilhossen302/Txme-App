import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../../../../Widgegt/Email_Input_Field/EmailInputField.dart';
import '../../../Choose_Language/choose_language.dart';

class Searchfilter extends StatefulWidget {
  const Searchfilter({super.key});

  @override
  State<Searchfilter> createState() => _SearchfilterState();
}

class _SearchfilterState extends State<Searchfilter> {
  // Service timing variables
  TimeOfDay fromTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay toTime = TimeOfDay(hour: 13, minute: 0);
  DateTime? selectedDate;

  // Filter sliders
  double rating = 2.5;
  double price = 250;
  double radius = 5;

  // Service type selection
  String selected = "ALL";
  final List<String> items = [
    "ALL",
    "wiring",
    "repairs",
    "emergency",
    "installations",
  ];

  // Pick time
  Future<void> pickTime(bool isFrom) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isFrom ? fromTime : toTime,
    );
    if (picked != null) {
      setState(() {
        if (isFrom)
          fromTime = picked;
        else
          toTime = picked;
      });
    }
  }

  // Pick date
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
        backgroundColor: AppColors.FFFFFF,
        title: Padding(
          padding: EdgeInsets.only(left: 45.w),
          child: Text(
            AppString.searchFilter,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24.sp),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Type Input
            CustomTextField(
              label: AppString.serviceType,
              hint: AppString.electrician,
              img: AppImg.searchIcon,
            ),
            SizedBox(height: 16.h),

            // Service Type Chips
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: items.map((item) {
                bool isActive = selected == item;
                return GestureDetector(
                  onTap: () => setState(() => selected = item),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
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
                        color: isActive ? Colors.white : Colors.grey.shade700,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),

            // Language Selection Widget
            Expanded(child: ChooseLanguage()),

            // Service Timing Section
            Padding(
              padding: EdgeInsets.only(bottom: 270.h),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 220.w),
                    child: Text(
                      AppString.serviceTiming.tr,
                      style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
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

                  // Date Picker
                  GestureDetector(
                    onTap: pickDate,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
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
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
