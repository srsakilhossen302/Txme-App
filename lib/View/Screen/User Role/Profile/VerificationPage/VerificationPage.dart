import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import 'VerificationController.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});

  final VerificationController controller = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 18.sp),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "Verification",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification Methods",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.h),

              // 🔹 Email
              _verificationItem(
                icon: Icons.email_outlined,
                title: "Email",
                status: controller.emailStatus,
                onTap: () {
                  // Email tap action
                  Get.snackbar("Email", "Email verification tapped");
                },
              ),
              SizedBox(height: 15.h),

              // 🔹 Mobile Number
              _verificationItem(
                icon: Icons.phone_iphone,
                title: "Mobile Number",
                status: controller.mobileStatus,
                onTap: () {
                  // Mobile tap action
                  Get.snackbar("Mobile", "Mobile verification tapped");
                },
              ),
              SizedBox(height: 15.h),

              // 🔹 ID Verification
              _verificationItem(
                icon: Icons.sim_card_outlined,
                title: "ID Verification",
                status: controller.idStatus,
                onTap: () {

                  Get.toNamed(AppRoute.verifyyouridentity);
                  // ID tap action
                  Get.snackbar("ID", "ID verification tapped");
                },
              ),
              SizedBox(height: 15.h),

              // 🔹 Address
              _verificationItem(
                icon: Icons.location_on_outlined,
                title: "Address",
                status: controller.addressStatus,
                onTap: () {
                  // Address tap action
                  Get.snackbar("Address", "Address verification tapped");
                },
              ),

              SizedBox(height: 40.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5A36),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
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
        bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
      ),
    );
  }

  // 🔹 Verification Item with onTap
  Widget _verificationItem({
    required IconData icon,
    required String title,
    required RxString status,
    VoidCallback? onTap, // <-- onTap here
  }) {
    return Obx(
          () => GestureDetector(
        onTap: onTap, // <-- handle tap
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.red601, width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 26.sp, color: Colors.blue),
                  SizedBox(width: 12.w),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                status.value,
                style: TextStyle(
                  color: Color(0xFFFF5A36),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
