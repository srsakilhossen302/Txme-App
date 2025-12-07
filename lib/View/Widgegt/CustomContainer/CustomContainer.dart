import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';

class Customcontainer extends StatelessWidget {
  final String img;
  final String cText;
   Customcontainer({
     Key? key,
     required this.cText,
     required this.img

   }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.FFFFFF,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 10.5.h, left: 15.w, right: 15.w),
            child: Image.asset(img),
          ),
          Text(
              cText, style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xff565656)
          ),
          )
        ],
      ),
    );
  }
}
