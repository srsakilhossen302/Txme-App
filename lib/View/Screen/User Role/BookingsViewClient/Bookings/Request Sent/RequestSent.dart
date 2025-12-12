import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';
import '../../../../../../Utils/AppIcons/app_icons.dart';
import '../../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../Model/demo_booking_data.dart';


class RequestSent  extends StatefulWidget {
  const RequestSent({super.key});

  @override
  State<RequestSent> createState() => _RequestSentState();
}

class _RequestSentState extends State<RequestSent> {
  final data = DemoBookingData.booking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 110.h),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.success,
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
              ),
              Text(
                AppString.requestSent.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(right: 45.w, left: 44.w, top: 8.h),
                child: Text(
                  AppString.servicerequest.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.black800),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
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
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(right: 240.w),
                child: Text(
                  "Add Job note",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: Color(0xff1F2937)),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                width: 348.w,
                height: 92.h,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  border: Border.all(color: Color(0xff3A7DFF)),
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppString.onlyPlease.tr,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1F2937)),
                      ),
                    )),
              ),
              SizedBox(height: 33.h),
              CustomButton(
                  height: 56.h,
                  width: 353.w,
                  BoxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.red601),
                  child: Center(
                      child: Text(
                        AppString.Done.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.FFFFFF),
                      )),
                  onTap: () {
                    Get.toNamed(AppRoute.myBookingsPage);
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }
}
