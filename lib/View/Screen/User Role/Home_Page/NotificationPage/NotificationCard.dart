import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRead = true; // hide blue dot after tap
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 5,
              offset:  Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// BLUE DOT (hidden when read = true)
            if (!isRead)
              Container(
                width: 10.w,
                height: 10.h,
                margin:  EdgeInsets.only(top: 5.h),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),

            if (!isRead)  SizedBox(width: 14.w),

            /// TEXT + ICON AREA
            Expanded(
              child: Row(
                children: [
                   Icon(Icons.notifications_none,
                      size: 24.sp, color: Color(0xff1F2937)),
                   SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style:  TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                         SizedBox(height: 4.h),
                        Text(
                          widget.subtitle,
                          style:  TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff1F2937),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}