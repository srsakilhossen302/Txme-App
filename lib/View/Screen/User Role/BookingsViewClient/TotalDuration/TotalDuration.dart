import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../../Widgegt/JobProgressTime/CountdownTimerWidget.dart';

class Totalduration extends StatefulWidget {
  const Totalduration({super.key});

  @override
  State<Totalduration> createState() => _TotaldurationState();
}

class _TotaldurationState extends State<Totalduration> {
  final Duration jobDuration = const Duration(hours: 2); // 2 hours
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              AppIcons.chevronleft,
              height: 18.h,
              width: 18.w,
            )),
        title: Padding(
          padding: EdgeInsets.only(left: 70.w),
          child: Text(
            "Total Duration",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2937)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                AppIcons.success,
                height: 100.h,
                width: 100.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Your job has been compleated",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1F2937)),
              ),
              SizedBox(
                height: 40.h,
              ),
              CountdownTimerWidget(totalDuration: jobDuration),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 353.w,
                height: 175.h,
                decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Color(0xffFF5A36), width: 1.w)),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 23.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lawn Mowing & Edging",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1F2937)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.location,
                            height: 18.h,
                            width: 16.w,
                            color: Color(0xff4C545F),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "123 Maple Street",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18.sp,
                                color: Color(0xff1F2937)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.date,
                            height: 18.h,
                            width: 16.w,
                            color: Color(0xff4C545F),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Tuesday, 28th May",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18.sp,
                                color: Color(0xff1F2937)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.prof,
                            height: 18.h,
                            width: 16.w,
                            color: Color(0xff4C545F),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Michelle R.",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18.sp,
                                color: Color(0xff1F2937)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Container(
                width: 353.w,
                height: 137.h,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  border: Border.all(color: Color(0xffFF5A36), width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.2),
                  //     blurRadius: 8,
                  //     spreadRadius: 2,
                  //     offset: Offset(0, 3),
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 9.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Job Notes",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1F2937)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Please be careful with the rose bushes near the driveway. The sprinkler system is scheduled to run at 5 PM.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1F2937)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  height: 56.h,
                  width: 353.w,
                  BoxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Color(0xffFF5A36),
                  ),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFFFFFF)),
                  )),
                  onTap: () {
                    Get.toNamed(AppRoute.paymentpage);
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }
}
