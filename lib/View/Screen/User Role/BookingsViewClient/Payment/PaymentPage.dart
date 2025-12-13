import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/AppIcons/app_icons.dart';
import '../../../../../core/App_Routes/app_routes.dart';
import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../../Widgegt/CustomContainer/TotalAmountDue.dart';
import '../../../../Widgegt/Custom_Button/custom_button.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
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
            "Payment",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2937)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Totalamountdue(),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 353.w,
                height: 175.h,
                decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Color(0xffFF5A36), width: 1.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 21.h, left: 12.w, right: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Job Details",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1F2937)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            "Service:",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1F2937)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            "Date:",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1F2937)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            "Service Provider:",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1F2937)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 47.h, right: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 12.h),
                          Text(
                            "Garden Maintenance",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4C545F)),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Tuesday, 28th May",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4C545F)),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Michelle R.",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4C545F)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 351.w,
                height: 173.h,
                decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Color(0xffFF5A36), width: 1.w)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, right: 160.w),
                      child: Text(
                        "Invoice Breakdown",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1F2937)),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time Worked:",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w200,
                                color: Color(0xff4C545F)),
                          ),
                          Text(
                            "2.5 hours",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1F2937)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hourly Rate:",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w200,
                                color: Color(0xff4C545F)),
                          ),
                          Text(
                            "€35.00/ hour",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1F2937)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Container(
                      width: 331.w,
                      height: 1.h,
                      color: Color(0xff4C545F),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1F2937)),
                          ),
                          Text(
                            "€87.00",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3A7DFF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomButton(
                  height: 56.h,
                  width: 353.w,
                  BoxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Color(0xff16A34A),
                  ),
                  child: Center(
                      child: Text(
                    "Pay With Cash",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFFFFFF)),
                  )),
                  onTap: () {
                    Get.toNamed(AppRoute.paymentpage);
                  }),
              SizedBox(
                height: 22.h,
              ),
              CustomButton(
                  height: 56.h,
                  width: 353.w,
                  BoxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Color(0xff3A7DFF),
                  ),
                  child: Center(
                      child: Text(
                    "Online payment ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFFFFFF)),
                  )),
                  onTap: () {
                    Get.toNamed(AppRoute.onlinepayment);
                  }),
              SizedBox(
                height: 22.h,
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
                    "Pay with Wallet",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFFFFFF)),
                  )),
                  onTap: () {
                    //Get.toNamed(AppRoute.paymentpage);
                  }),
              SizedBox(
                height: 22.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }
}
