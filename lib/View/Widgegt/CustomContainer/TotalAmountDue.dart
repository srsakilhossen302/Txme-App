import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Totalamountdue extends StatelessWidget {

  const Totalamountdue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 166.h,
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(

        children: [
          Padding(
            padding:  EdgeInsets.only(top: 12.h),
            child: Text(
              "Total Amount Due",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300, color: Color(0xff1F2937)),
            ),
          ),
           SizedBox(height: 10.h),
          Text(
           "€87.50",
            style:  TextStyle(
              fontSize: 50.sp,
              color: Color(0xff2563EB),
              fontWeight: FontWeight.w500,
            ),
          ),
           SizedBox(height: 10.h),
           Text("Due on May 28, 2025",
            style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.w300, color: Color(0xff4C545F)),
          ),
        ],
      ),
    );
  }
}
