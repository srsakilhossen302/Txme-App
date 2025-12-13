import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../Home_Page/AppoinmentScreen/ScheduleBookingPage.dart';

class BookingModel {
  final String name;
  final String image;
  final String date;
  final String service;
  final String status;

  BookingModel({
    required this.name,
    required this.image,
    required this.date,
    required this.service,
    required this.status,
  });
}

class MyBookingsPage extends StatelessWidget {
  MyBookingsPage({super.key});

  final List<BookingModel> currentJob = [
    BookingModel(
      name: "Jane Doe",
      image: "https://i.pravatar.cc/150?img=1",
      date: "Mon, Nov 6, 2:00 PM",
      service: "1 hour Cleaning",
      status: "Started",
    ),
  ];

  final List<BookingModel> pending = [
    BookingModel(
      name: "Jane Doe",
      image: "https://i.pravatar.cc/150?img=2",
      date: "Mon, Nov 6, 2:00 PM",
      service: "1 hour Cleaning",
      status: "Pending",
    ),
    BookingModel(
      name: "Jane Doe",
      image: "https://i.pravatar.cc/150?img=3",
      date: "Mon, Nov 6, 2:00 PM",
      service: "1 hour Cleaning",
      status: "Pending",
    ),
  ];

  final List<BookingModel> completed = [
    BookingModel(
      name: "Jane Doe",
      image: "https://i.pravatar.cc/150?img=4",
      date: "Mon, Nov 6, 2:00 PM",
      service: "1 hour Cleaning",
      status: "Confirmed",
    ),
  ];

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "started":
        return Color(0xff42d589,);
      case "confirmed":
        return Colors.green.shade400;
      case "pending":
        return Colors.blue.shade400;
      default:
        return Colors.grey;
    }
  }

  Widget buildBookingCard(BookingModel booking) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const BookingSchedulePage());
      },
      child: Container(
        width: 353.w,
        height: 120.h,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(12.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 6.r,
          //     offset: Offset(0, 3.h),
          //   ),
          // ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Image
            CircleAvatar(
              radius: 25.r,
              backgroundImage: NetworkImage(booking.image),
            ),
            SizedBox(width: 12.w),

            // Booking Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  Text(
                    booking.name,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4C545F)),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    booking.date,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    booking.service,
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff333333), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),


            // Status Badge
            Padding(
              padding:  EdgeInsets.only(top: 13.h ),
              child: Container(
                width: 64.w,
                height: 23.h,
                decoration: BoxDecoration(
                  color: getStatusColor(booking.status),
                  borderRadius: BorderRadius.circular(8.r), // pill shape
                ),
                child: Center(
                  child: Text(
                    booking.status,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildSection(String title, List<BookingModel> bookings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.h),
        ...bookings.map((b) => buildBookingCard(b)).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      appBar: AppBar(

        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(AppIcons.chevronleft)),

        title: GestureDetector(
          onTap: (){
            Get.toNamed(AppRoute.jobPage);
          },
          child: Text(
            "My Booking",
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentJob.isNotEmpty) buildSection("Current Job", currentJob),
            if (pending.isNotEmpty) buildSection("Pending", pending),
            if (completed.isNotEmpty) buildSection("Completed", completed),
            SizedBox(height: 20.h),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),

    );
  }
}
