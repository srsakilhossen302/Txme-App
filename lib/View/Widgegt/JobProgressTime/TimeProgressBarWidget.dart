import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeProgressBarWidget extends StatefulWidget {
  final Duration totalDuration;

  const TimeProgressBarWidget({super.key, required this.totalDuration});

  @override
  State<TimeProgressBarWidget> createState() => _TimeProgressBarWidgetState();
}

class _TimeProgressBarWidgetState extends State<TimeProgressBarWidget> {
  Duration elapsed = Duration.zero;
  double progress = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (elapsed.inSeconds < widget.totalDuration.inSeconds) {
        setState(() {
          elapsed = Duration(seconds: elapsed.inSeconds + 1);
          progress = elapsed.inSeconds / widget.totalDuration.inSeconds;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = 16.w;
    double progressBarWidth = screenWidth - horizontalPadding * 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top times
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "12:00 pm",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Color(0xff565656)),
              ),
              Text(
                "2:00 pm",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Color(0xff565656)),
              ),
            ],
          ),

          SizedBox(height: 5.h),

          // Middle elapsed time
          Text(
            elapsed.inMinutes.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Color(0xff4C545F)),
          ),

          SizedBox(height: 4.h),

          // Custom Slider Bar
          SizedBox(
            height: 20.h,
            child: Stack(
              children: [
                // Inactive line
                Positioned(
                  top: 8.h,
                  left: 0,
                  child: Container(
                    width: progressBarWidth,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                  ),
                ),

                // Active line
                Positioned(
                  top: 8.h,
                  left: 0,
                  child: Container(
                    width: progressBarWidth * progress,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade700,
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                  ),
                ),

                // Moving Circle
                Positioned(
                  left: progress * progressBarWidth - 8.w, // circle radius half width
                  top: 2.h,
                  child: Container(
                    width: 15.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade700,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
