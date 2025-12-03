import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';

class Faceverificationdone extends StatefulWidget {
  const Faceverificationdone({super.key});

  @override
  State<Faceverificationdone> createState() => _FaceverificationdoneState();
}

class _FaceverificationdoneState extends State<Faceverificationdone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 319.h),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.success,
                height: 100.h,
                width: 100.w,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Text(
            AppString.verificationDone,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: AppColors.black900,
            ),
          ),

          SizedBox(height: 151.h),
          CustomButton(
            height: 56.h,
            width: 353.w,
            BoxDecoration: BoxDecoration(
              color: AppColors.red601,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                AppString.Continue,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.FFFFFF,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
