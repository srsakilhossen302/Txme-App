import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownTimerWidget extends StatefulWidget {
  final Duration totalDuration;

  const CountdownTimerWidget({super.key, required this.totalDuration});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Duration remaining;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remaining = widget.totalDuration;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remaining = Duration(seconds: remaining.inSeconds - 1);
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inHours)}:"
        "${twoDigits(duration.inMinutes % 60)}:"
        "${twoDigits(duration.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 166.h,
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(

        children: [
           Padding(
             padding:  EdgeInsets.only(top: 12.h),
             child: Text(
              "Job In Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Color(0xff1F2937)),
                       ),
           ),
          const SizedBox(height: 5),
          Text(
            formatTime(remaining),
            style: const TextStyle(
              fontSize: 50,
              color: Color(0xff2563EB),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text("Time Elapsed",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff4C545F)),
          ),
        ],
      ),
    );
  }
}
