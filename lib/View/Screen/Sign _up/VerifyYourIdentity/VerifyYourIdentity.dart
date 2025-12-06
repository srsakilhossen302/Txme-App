import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

class Verifyyouridentity extends StatefulWidget {
  const Verifyyouridentity({super.key});

  @override
  State<Verifyyouridentity> createState() => _VerifyyouridentityState();
}

class _VerifyyouridentityState extends State<Verifyyouridentity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.VerifyIdentity.tr),

        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 34.h),

            Text(
              AppString.followingVerifications.tr,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.uploaddocuments1);
              },
              child: Container(
                height: 126.h,
                width: 352.w,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 17.h,
                        left: 8.w,
                        right: 8.w,
                      ),
                      child: Image.asset(
                        AppImg.image10,
                        height: 48.h,
                        width: 48.w,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 21.h, right: 185.w),
                          child: Text(
                            AppString.Verification.tr,
                            style: TextStyle(
                              color: AppColors.black700,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 45.w),
                              child: Text(
                                AppString.UploadcopyID.tr,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black700,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios, size: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 210.w),
                          child: Text(
                            AppString.Passport.tr,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 34.h),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoute.uploaddocuments2);
              },
              child: Container(
                height: 126.h,
                width: 352.w,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 17.h, left: 8.w, right: 8.w),
                      child: Image.asset(
                        AppImg.image10,
                        height: 48.h,
                        width: 48.w,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 21.h, right: 185.w),
                          child: Text(
                            AppString.Verification.tr,
                            style: TextStyle(
                              color: AppColors.black700,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 45.w),
                              child: Text(
                                AppString.UploadcopyID.tr,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black700,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios, size: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 210.w),
                          child: Text(
                            AppString.Passport.tr,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 34.h),
            CustomButton(
              height: 56.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                color: AppColors.red601,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  AppString.Continue,
                  style: TextStyle(
                    color: AppColors.FFFFFF,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {

                Get.toNamed(AppRoute.homepage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
