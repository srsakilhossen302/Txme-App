import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Utils/AppColors/app_colors.dart';

class BookingSchedulePage extends StatefulWidget {
  const BookingSchedulePage({super.key});

  @override
  State<BookingSchedulePage> createState() => _BookingSchedulePageState();
}

class _BookingSchedulePageState extends State<BookingSchedulePage> {
  int selectedIndex = 2; // today index

  /// --------- JSON DATA (Replace with API) ----------
  List<Map<String, dynamic>> dates = [
    {"day": 18, "week": "Mo"},
    {"day": 19, "week": "Tu"},
    {"day": 20, "week": "We"},
    {"day": 21, "week": "Th"},
    {"day": 22, "week": "Fr"},
    {"day": 23, "week": "Sa"},
    {"day": 24, "week": "Su"},
  ];

  /// SCHEDULE
  Map<String, dynamic> scheduleJson = {
    "21": [
      {"time": 8, "status": "Booked"},
      {"time": 9, "status": "Booked"},
      {"time": 11, "status": "Not available"},
      {"time": 14, "status": "Not available"},
    ],
    "20": [
      {"time": 10, "status": "Booking request"},
    ],
    "18": [],
  };

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "booked":
        return const Color(0xFFFF5A36);
      case "not available":
        return const Color(0xFF1A2434);
      case "booking request":
        return const Color(0xFFFFC107);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedDay = dates[selectedIndex]["day"];
    List daySchedules = scheduleJson["$selectedDay"] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          " ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 16.h),

            /// ------------------ DATE SCROLLER ------------------
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      width: 55.w,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFF5A36) : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            dates[index]["day"].toString(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            dates[index]["week"],
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4.h),

                          /// DOT INDICATOR
                          if (isSelected)
                            Container(
                              width: 6.w,
                              height: 6.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Schedule Today",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 16.h),

            /// ------------------ SCHEDULE AREA ------------------
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [

                      /// Hours Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          9,
                              (i) {
                            int hour = 8 + i;
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              child: Text(
                                "${hour.toString().padLeft(2, '0')}.00",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 20.w),

                      /// ---- Bookings Column ----
                      SizedBox(
                        width: 250.w,
                        child: Stack(
                          children: daySchedules.map((item) {
                            double top = (item["time"] - 8) * 55.h;

                            return Positioned(
                              top: top,
                              left: 0.w,
                              child: Container(
                                width: 160.w,
                                padding: EdgeInsets.all(12.w),
                                margin: EdgeInsets.only(bottom: 12.h),
                                decoration: BoxDecoration(
                                  color: getStatusColor(item["status"]),
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                                child: Text(
                                  item["status"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            /// ------------------ CONFIRM BUTTON ------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5A36),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Confirm Booking",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
