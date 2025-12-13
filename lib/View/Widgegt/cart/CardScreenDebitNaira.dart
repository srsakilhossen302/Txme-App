import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/AppImg/app_img.dart';

class CustomDebitCard extends StatelessWidget {
  final String cardType;
  final String cardNumber;       /// Raw number: 5782818177770032
  final String expiryDate;
  final String cardHolderName;

  const CustomDebitCard({
    super.key,
    required this.cardType,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
  });

  String formatCardNumber(String number) {
    number = number.replaceAll(' ', '').trim();
    const space = "      "; /// 6 spaces

    return number.replaceAllMapped(
      RegExp(r'.{1,4}'),
          (match) => "${match.group(0)}$space",
    ).trim();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.w,
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(AppImg.creditcard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [

          /// TOP ICONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 21.w),
                child: SvgPicture.asset(AppIcons.wifiIcons),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, right: 53.w),
                child: SvgPicture.asset(AppIcons.bankIcons),
              )
            ],
          ),

          /// CARD TYPE
          Padding(
            padding: EdgeInsets.only(right: 265.w, ),
            child: Column(
              children: [
                Text(
                  cardType,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0.w),
                  child: SvgPicture.asset(AppIcons.sim),
                )
              ],
            ),
          ),

          SizedBox(height: 4.h),

          /// ************ FORMATTED CARD NUMBER ************
          Text(
            formatCardNumber(cardNumber),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFFFFFFF),
            ),
          ),

          /// EXPIRY DATE
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 98.w),
                child: Column(
                  children: [
                    Text("VALID",
                        style: TextStyle(
                            fontSize: 10.sp, color: const Color(0xFFFFFFFF))),
                    Text("THRU",
                        style: TextStyle(
                            fontSize: 10.sp, color: const Color(0xFFFFFFFF))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 23.w),
                child: Column(
                  children: [
                    Text(
                      "MON/YR",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      expiryDate,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// CARD HOLDER NAME & LOGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 26.w),
                child: Text(
                  cardHolderName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: SvgPicture.asset(
                  AppIcons.masterCardLogo,
                  height: 30.h,
                  width: 45.w,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
