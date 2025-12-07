
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../Custom_Button/custom_button.dart';

class Customfavoriteproviderscontainer extends StatefulWidget {

  const Customfavoriteproviderscontainer({super.key});

  @override
  State<Customfavoriteproviderscontainer> createState() => _CustomfavoriteproviderscontainerState();
}

class _CustomfavoriteproviderscontainerState extends State<Customfavoriteproviderscontainer> {
  bool isUserSelected = true;
  @override
  Widget build(BuildContext context) {

    return Container(

      width: 353.w,
      height: 186.h,
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(  top: 20.h,  left: 20.w,),
                child: Image.asset(AppImg.ellipse),
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 20.h, left: 8.w),
                    child: Text("Sarah’s Cleaning", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff1F2937)
                    ),),
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFC107), // golden color
                        size: 18,
                      ),
                      SizedBox(width: 4),

                      Text(
                        "4.8",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 4),

                      Text(
                        "(128 reviews)",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Image.asset(AppImg.vector, height: 16, width: 14,),
                      SizedBox(width: 4),
                      Text(AppString.availableToday.tr,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3A7DFF)
                      ),
                      )
                    ],
                  ),


                ],
              ),

            ],
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                CustomButton(
                  height: 47.h,
                  width: 153.w,
                  BoxDecoration: BoxDecoration(
                    color: isUserSelected
                        ? AppColors.red601
                        : Colors.transparent,
                    border: Border.all(color: AppColors.red601, width: 1.w),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      AppString.bookNow.tr,
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
                        : Colors.transparent,
                    border: Border.all(color: AppColors.red601, width: 1.w),
                    //color: AppColors.red601,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      AppString.viewProfile.tr,
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

                      //Get.toNamed(AppRoute.faceIDSetupScreen);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
