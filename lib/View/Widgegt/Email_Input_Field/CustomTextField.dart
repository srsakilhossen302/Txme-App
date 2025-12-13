import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';

class CustomTextFieldC extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final bool readOnly;
  final  Color? color;
  final Widget? suffixIcon;
  final InputBorder? border;
  final VoidCallback? onTap; // Optional onTap callback

  const CustomTextFieldC({
    Key? key,
    required this.controller,

    required this.label,
    this.border,
    this.color,
    required this.hintText,
    this.suffixIcon,
    this.onTap,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500), )


        ),
         SizedBox(height: 8.h),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap, // onTap will be triggered if provided, else null
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: color ,
            border: border,
            suffixIcon: suffixIcon, // Use the passed suffixIcon (if any)
          ),
        ),
      ],
    );
  }
}
