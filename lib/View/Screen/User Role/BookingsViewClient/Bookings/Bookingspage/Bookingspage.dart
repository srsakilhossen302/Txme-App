import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Home_Page/AppoinmentScreen/ScheduleBookingPage.dart';
import 'BookingspageController.dart';
import '../../../../../../Utils/AppColors/app_colors.dart';

class Bookingspage extends StatelessWidget {
  Bookingspage({super.key});
  final controller = Get.put(BookingspageController());

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return AppColors.A7DFF;
      case "confirmed":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget buildCard(appointment) {
    return GestureDetector(
      onTap: () => Get.to(() => BookingSchedulePage()),
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300, width: 1.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(appointment.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.name,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Booking Date: ${appointment.date}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    appointment.description,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            // Status Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: getStatusColor(appointment.status),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                appointment.status.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, String status) {
    return Obx(() {
      final items = controller.filter(status);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 10.h),
          if (items.isEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                "No bookings",
                style: TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
            ),
          ...items.map((e) => buildCard(e)).toList(),
          SizedBox(height: 20.h)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Appointments",
            style: TextStyle(
                fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection("Pending", "pending"),
            buildSection("Confirmed", "confirmed"),
            buildSection("Cancelled", "cancelled"),
          ],
        ),
      ),
    );
  }
}
