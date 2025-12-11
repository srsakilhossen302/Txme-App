import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';

import '../../../../Utils/AppImg/app_img.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../../core/App_Routes/app_routes.dart';
import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../Widgegt/CustomBottomNavBar/ProviderNavBar.dart';
import '../../User Role/Home_Page/AppoinmentScreen/AppoinmentScreen.dart';
import '../../User Role/Home_Page/NotificationPage/NotificationPage.dart';
import 'ProviderHomeController.dart';




class ProviderHomeScreen extends StatelessWidget {
  final ProviderHomeController controller = Get.put(ProviderHomeController());

  ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 30,),

            /// ------------------ HEADER ------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                    children: [
                      const TextSpan(text: 'Welcome, '),
                      TextSpan(
                        text: controller.name.value,
                        style: const TextStyle( fontSize: 24,  fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    Get.to(() => NotificationPage());
                  },
                  child: Obx(() => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_none, size: 30),
                      if(controller.notificationCount.value > 0)
                        Positioned(
                          right: -1,
                          top: -1,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                controller.notificationCount.value.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )),
                ),
              ],
            ),
            const SizedBox(height: 30,),

            /// 1. Offer a Service Button
            GestureDetector(
              onTap: () {
                // এখানে আপনার Logic লিখতে পারবেন
              },
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5A36),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Offer a Service",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 21),

            /// 2. Balance Card
            Container(
              width: 353.w,
              height: 148.h,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(8),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(
                    "Earning This Week",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff1F2937),
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "€1,250.00",
                    style: TextStyle(
                      fontSize: 48.0,
                      color: Color(0xff1F2937),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 3. Promotion Card
            Align(
              child: Container(
                width: 353,
                height: 189,
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const Text(
                        "Boost your visibility with Txme!",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4C545F)
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:  Text(
                        "Get your service listed at the top of search"
                            " results for just € 1 per day!",
              
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333)
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Center(
                      child: SizedBox(
                        width: 253,
                        height: 47,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red601,
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {},
                          child:  Text(
                            "Advertise your service Today",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: AppColors.FFFFFF,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Job",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.gray900),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoute.appointmentsPage);
                  },
                  child: Text(
                    AppString.viewAll.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.A7DFF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ------------------ UPCOMING APPOINTMENTS ------------------
            Container(
              width: 353.w,
              height: 144.h,
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  /// LEFT TEXT AREA
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, left: 20.w),
                          child: Text(
                            "Tomorrow, 10:00 AM",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7C7D7E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, left: 20.w),
                          child: Text(
                            "Home Cleaning",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff1D1D1D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, left: 20.w),
                          child: Text(
                            "With Sarah Miller",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7C7D7E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// RIGHT IMAGE
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          AppImg.ellipse,
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 353.w,
              height: 144.h,
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  /// LEFT TEXT AREA
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, left: 20.w),
                          child: Text(
                            "Tomorrow, 10:00 AM",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7C7D7E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, left: 20.w),
                          child: Text(
                            "Home Cleaning",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff1D1D1D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, left: 20.w),
                          child: Text(
                            "With Sarah Miller",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7C7D7E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// RIGHT IMAGE
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          AppImg.ellipse,
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: CustomProvidernavbar(selectedIndex: 0),
    );
  }
}
