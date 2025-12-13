import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppIcons/app_icons.dart';
import 'package:txme_app/View/Screen/User%20Role/BookingsViewClient/Bookings/Request%20Sent/RequestCustom.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';
import '../../../../../../Utils/AppColors/app_colors.dart';

class Paymentsuccessful extends StatefulWidget {
  final int rating;

  const Paymentsuccessful({Key? key, this.rating = 0}) : super(key: key);

  @override
  State<Paymentsuccessful> createState() => _PaymentsuccessfulState();
}

class _PaymentsuccessfulState extends State<Paymentsuccessful> {
  int userRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.FFFFFF,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 76.h),
            child: Center(child: SvgPicture.asset(AppIcons.success)),
          ),
          SizedBox(height: 12.h),
          Text(
            "Payment Successful",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff1F2937),
            ),
          ),
          SizedBox(height: 20.h),
          Requestcustom(),
          Padding(
            padding: EdgeInsets.only(left: 297.w, top: 8.h),
            child: CustomButton(
              height: 24.h,
              width: 75.w,
              BoxDecoration: BoxDecoration(),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.download),
                  Text(
                    " Invoice",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Color(0xffFF5A36),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed(AppRoute.invoicePListPage);
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Rate Your Experience",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff1F2937),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    userRating = index + 1;
                  });
                },
                child: Icon(
                  index < userRating ? Icons.star : Icons.star_border,
                  color: index < userRating ? Colors.orange : Colors.grey,
                ),
              );
            }),
          ),

          SizedBox(height: 20.h,),

          Container(
            width: 353.w,
            height: 105.h,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xFF3A7DFF)),

            ),

            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Write your feedback" ,
                  hintStyle: TextStyle(color: Color(0xff1F2937), fontSize: 14.sp, fontWeight: FontWeight.w400),
                  counterText: "",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          SizedBox(height: 20.h,),

          CustomButton(
              height: 56.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xffFF5A36),
              ),
              child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFFFFFF)),
                  )),
              onTap: () {
                Get.toNamed(AppRoute.homepage);
              }),


        ],
      ),
    );
  }
}
