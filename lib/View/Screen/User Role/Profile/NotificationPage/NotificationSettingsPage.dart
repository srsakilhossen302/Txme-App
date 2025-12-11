import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'NotificationController.dart';
import '../../../../../Utils/AppColors/app_colors.dart';

class NotificationSettings extends StatelessWidget {
  NotificationSettings({super.key});

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Notification",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _notificationCard(
              child: _notificationRow(
                title: "General Notification",
                value: controller.generalNotification,
                onTap: controller.toggleGeneral,
              ),
            ),
            SizedBox(height: 15.h),
            _notificationCard(
              child: _notificationRow(
                title: "Sound",
                value: controller.soundNotification,
                onTap: controller.toggleSound,
              ),
            ),
            SizedBox(height: 15.h),
            _notificationCard(
              child: _notificationRow(
                title: "Vibrate",
                value: controller.vibrateNotification,
                onTap: controller.toggleVibrate,
              ),
            ),
            SizedBox(height: 60.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red601,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------- Notification Card -------------------------
  Widget _notificationCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xffD4E0EB).withOpacity(0.1),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: child,
    );
  }

  // ------------------------- Notification Row -------------------------
  Widget _notificationRow({
    required String title,
    required RxBool value,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff333333),
          ),
        ),
        Obx(() => _customToggle(value.value, onTap)),
      ],
    );
  }

  // ------------------------- Custom Toggle -------------------------
  Widget _customToggle(bool value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 55.w,
        height: 28.h,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: value ? Color(0xffEEEEEE) : Colors.white, // On=red bg, Off=white
          borderRadius: BorderRadius.circular(20.r),
          border: value
              ? null // On হলে কোন border নেই
              : Border.all(
            color: Colors.grey.shade400,
            width: 1.5.w,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value ? AppColors.red601 : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }

}
