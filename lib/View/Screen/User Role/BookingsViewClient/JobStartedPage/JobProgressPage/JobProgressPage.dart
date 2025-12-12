import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import '../../../../../Widgegt/JobProgressTime/CountdownTimerWidget.dart';
import '../../../../../Widgegt/JobProgressTime/TimeProgressBarWidget.dart';

class JobPage extends StatelessWidget {
  JobPage({super.key});

  final Duration jobDuration = const Duration(hours: 2); // 2 hours

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(AppIcons.chevronleft, height: 18.h, width: 18.w,)),
        title: Padding(
          padding: EdgeInsets.only(left: 70.w),
          child: Text(
            "Job Started",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2937)),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 45.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            CountdownTimerWidget(totalDuration: jobDuration),
             SizedBox(height: 28.h),
            TimeProgressBarWidget(totalDuration: jobDuration),
          ],
        ),
      ),
    );
  }
}
