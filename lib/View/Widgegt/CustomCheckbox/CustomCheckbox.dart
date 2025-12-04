import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: value ? Color(0xff1F2937) : Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: value ? Color(0xff1F2937)  : Colors.grey,
            width: 2,
          ),
        ),
        child: value
            ? const Icon(
          Icons.check,
          size: 14,
          color: Color(0xffFFFFFF) ,
        )
            : null,
      ),
    );
  }
}
