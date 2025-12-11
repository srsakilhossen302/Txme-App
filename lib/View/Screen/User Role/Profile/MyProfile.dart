import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/View/Screen/User%20Role/Profile/pastInvoice/InvoiceListPage.dart';
import 'package:txme_app/View/Screen/User%20Role/Profile/profile_controller.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../Widgegt/Logout/Logout.dart';
import '../../Sign _up/FaceIDSetupScreen/FaceIDSetupScreen.dart';
import 'EditProfile/EditProfile.dart';
import 'NotificationPage/NotificationSettingsPage.dart';
import 'VerificationPage/VerificationPage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ================= PROFILE HEADER =================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45.r,
                  backgroundImage: const NetworkImage("https://i.pravatar.cc/300"),
                ),
                SizedBox(width: 16.w),

                Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text(
                      controller.userName.value,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star, size: 18.sp, color: Colors.orange),
                        SizedBox(width: 5.w),
                        Text(
                          controller.rating.value.toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),

            SizedBox(height: 22.h),

            /// ================= PROFILE INFORMATION =================
            Text(
              "Profile information",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: const Color(0xff565656),
              ),
            ),
            SizedBox(height: 12.h),

            profileMenu(
            onTap: () => Get.to(() =>  EditProfilePage()),
              img: AppImg.editProfile,
              title: "Edit Profile",
            ),
            profileMenu(
              onTap: () => Get.to(() =>  VerificationPage()),

              img: AppImg.verification,
              title: "Verification",
            ),
            profileMenu(
              onTap: () => Get.to(() =>  FaceIDSetupScreen()),
              img: AppImg.faceIdImg,
              title: "Setup FaceID",
            ),
            profileMenu(
              img: AppImg.wallet,
              title: "Wallet",
            ),

            SizedBox(height: 20.h),

            /// ================= GENERAL PREFERENCES =================
            Text(
              "General Preferences",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.black87),
            ),
            SizedBox(height: 12.h),

            profileMenu(
              onTap: () => Get.to(() =>   NotificationSettings()),
              img: AppImg.notification,

              title: "Notification",
            ),
            profileMenu(
              onTap: () => Get.to(() => InvoiceListPage()), // pass the page, not the controller
              img: AppImg.pastInvoices,
              title: "Past Invoices",
            ),

            faqItem(),
            logoutItem(),

            SizedBox(height: 20.h),

            /// ================= SWITCH TO PROVIDER MODE =================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImg.Change, height: 40.h, width: 40.w),
                SizedBox(width: 6.w),
                Text(
                  "Change to Service Provider Mode",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            CustomButton(
              height: 56.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.red601),
              ),
              child: Center(
                child: Text(
                  "Switch",
                  style: TextStyle(
                    color: AppColors.black700,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              onTap: () {},
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
    );
  }

  /// ================= MENU ITEM =================
  Widget profileMenu({
    required String title,
    VoidCallback? onTap,
    required String img,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6.r,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(img, height: 44.h, width: 44.w),

            SizedBox(width: 14.w),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                ),
              ),
            ),

            Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFF5A36),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= FAQ =================
  Widget faqItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xffF5F9FB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.asset(AppImg.FAQ, height: 44.h, width: 44.w),
          SizedBox(width: 14.w),
          Expanded(
            child: Text(
              "FAQ (THIS IS LINKED WITH TXME FAQ)",
              style: TextStyle(
                color: AppColors.red601,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= LOGOUT =================
  /// ================= LOGOUT =================
  Widget logoutItem() {
    return GestureDetector(
      onTap: () {
        // Show popup using Get.dialog
        Get.dialog(
          const CustomLogoutPopup(),
          barrierDismissible: true, // tap outside to dismiss
          barrierColor: Colors.black.withOpacity(0.5), // dim background
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xffF5F9FB),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Image.asset(AppImg.Logout, height: 44.h, width: 44.w),
            SizedBox(width: 14.w),
            Text(
              "Logout",
              style: TextStyle(
                color: AppColors.red601,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
