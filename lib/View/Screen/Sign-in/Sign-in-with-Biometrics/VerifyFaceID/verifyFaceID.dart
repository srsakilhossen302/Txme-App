import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';

class Verifyfaceid extends StatefulWidget {
  const Verifyfaceid({super.key});

  @override
  State<Verifyfaceid> createState() => _VerifyfaceidState();
}

class _VerifyfaceidState extends State<Verifyfaceid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// **** Full Background Face Image ****
          Positioned.fill(
            child: Image.asset(AppImg.verifyFaceID, fit: BoxFit.cover),
          ),

          /// **** Circle Scanner Overlay ****
          Center(
            child: Container(
              width: 250.w,
              height: 250.w,
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   border: Border.all(
              //     color: Colors.lightBlueAccent.withOpacity(0.8),
              //     width: 4.w,
              //   ),
              // ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 70.h, left: 25.w),
            child: Container(
              width: 353.w,
              height: 410.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffACCCF2), width: 5.w),
              ),
            ),
          ),

          /// **** Bottom Button ****
          Positioned(
            bottom: 210.h,
            left: 20.w,
            right: 20.w,
            child: CustomButton(
              height: 55.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                color: AppColors.red601,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.faceIdScan,
                    color:AppColors.FFFFFF,
                    height: 22.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    AppString.authenticateFaceID,
                    style: TextStyle(
                      color:AppColors.FFFFFF,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),

            // Container(
            //   height: 55.h,
            //   decoration: BoxDecoration(
            //     color: AppColors.red601,
            //     borderRadius: BorderRadius.circular(12.r),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         AppIcons.faceIdScan,
            //         color: Colors.white,
            //         height: 22.h,
            //       ),
            //       SizedBox(width: 8.w),
            //       Text(
            //         "Authenticate Using Face ID",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
