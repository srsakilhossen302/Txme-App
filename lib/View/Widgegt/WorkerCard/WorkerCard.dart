import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Screen/User Role/Home_Page/DetailsPage/ProvidersDetailsPage.dart';
import '../../Screen/User Role/Home_Page/models/provider_model.dart';

class WorkerCard extends StatelessWidget {
  final ProviderModel provider;

  const WorkerCard({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsPage(provider: provider));
      },
      child: Container(
        height: 222.h, // responsive height
        width: 156.w, // responsive width
        padding: EdgeInsets.all(16.w), // responsive padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.r), // responsive radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 20.r, // responsive blur
              offset: Offset(0, 10.h), // responsive offset
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: provider.image.startsWith("http")
                  ? Image.network(
                provider.image,
                height: 116.h,
                width: 124.w,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                provider.image,
                height: 116.h,
                width: 124.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              provider.name,
              style: TextStyle(
                  fontSize: 16.sp, // responsive font
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4C545F)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              provider.service,
              style: TextStyle(
                fontSize: 12.sp, // responsive font
                color: Color(0xff4C545F),
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xffFF5A36), size: 14.sp), // responsive icon
                SizedBox(width: 6.w),
                Text(
                  provider.rating.toString(),
                  style: TextStyle(
                    fontSize: 12.sp, // responsive font
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4C545F),
                  ),
                ),
                SizedBox(width: 19.w),
                Container(
                  width: 70.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10, // responsive font
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
