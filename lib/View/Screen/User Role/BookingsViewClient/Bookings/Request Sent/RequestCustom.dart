import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../Utils/StaticString/static_string.dart';
import '../Model/demo_booking_data.dart';

class Requestcustom extends StatelessWidget {

  final data = DemoBookingData.booking;

   Requestcustom({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 353.w,
      height: 162.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Color(0xff3A7DFF), width: 1.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.Username.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppString.requesthelp.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppString.price.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppString.Date.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppString.time.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, right: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.name.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(height: 12.h),

                Text(
                  data.service.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(height: 12.h),

                /// এখানে price + (Hourly)
                Text(
                  data.formattedPrice.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(height: 12.h),

                Text(
                  data.date.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
                SizedBox(height: 12.h),

                Text(
                  data.time.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1F2937)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
