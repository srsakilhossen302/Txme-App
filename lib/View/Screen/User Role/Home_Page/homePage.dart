import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/CustomContainer/CustomContainer.dart';
import 'package:txme_app/View/Widgegt/CustomFavoriteProvidersContainer/CustomFavoriteProvidersContainer.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../Utils/AppColors/app_colors.dart';

import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        actions: [
          IconButton(onPressed: () {
            Get.toNamed(AppRoute.notificationPage);
          }, icon: Icon(Icons.notifications)),
        ],
        title: Row(
          children: [
            Text(
              AppString.Welcome,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24.sp),
            ),
            Text(
              AppString.Oliver,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                  color: Color(0xffF7F7F7),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.searchfilter);
                        },
                        child: Icon(Icons.search_sharp)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            AppRoute.searchfilter); // এখানে তোমার next screen
                      },
                      child: Image.asset(AppImg.adjustments),
                    ),
                    hintText: AppString.searchServices.tr,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.popularServices.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.gray900),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoute.popularservices);
                    },
                    child: Text(
                      AppString.viewAll.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.A7DFF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Customcontainer(
                      cText: AppString.plumbing, img: AppImg.plumber),
                  Customcontainer(
                      cText: AppString.painting, img: AppImg.painting),
                  Customcontainer(
                      cText: AppString.solar, img: AppImg.solarEnergy),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Customcontainer(
                      cText: AppString.airCondition,
                      img: AppImg.airConditenior),
                  Customcontainer(
                      cText: AppString.roofRepair, img: AppImg.roofRepair),
                  Customcontainer(
                      cText: AppString.electric, img: AppImg.multimeter),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.favoriteProviders.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.gray900),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoute.electricianproviders);
                    },
                    child: Text(
                      AppString.viewAll.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.A7DFF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Customfavoriteproviderscontainer(),
              SizedBox(
                height: 20.h,
              ),
              Customfavoriteproviderscontainer(),
              SizedBox(
                height: 20.h,
              ),
              Customfavoriteproviderscontainer(),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.upcomingAppointments.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.gray900),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoute.appointmentsPage);
                    },
                    child: Text(
                      AppString.viewAll.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.A7DFF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 353.w,
                height: 144.h,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    /// LEFT TEXT AREA
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, left: 20.w),
                            child: Text(
                              "Tomorrow, 10:00 AM",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff7C7D7E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h, left: 20.w),
                            child: Text(
                              "Home Cleaning",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff1D1D1D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h, left: 20.w),
                            child: Text(
                              "With Sarah Miller",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7C7D7E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// RIGHT IMAGE
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            AppImg.ellipse,
                            height: 80.h,
                            width: 80.w,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
    );
  }
}
