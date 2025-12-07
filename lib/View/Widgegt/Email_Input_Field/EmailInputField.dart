import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String? img;   // <-- Changed here

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.img,  // <-- Changed here
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.gray,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.red601,
              width: 1.5,
            ),
            color: const Color(0xffF7F7F7),
          ),
          child: Row(
            children: [
              if (img != null)
                Image.asset(
                  img!,       // <-- use img!
                  color: AppColors.gray,
                  height: 28.h,
                  width: 28.w,
                ),
              if (img != null)
                SizedBox(width: 12.w),

              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
