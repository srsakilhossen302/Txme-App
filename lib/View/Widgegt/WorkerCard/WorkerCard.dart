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
        height: 222.h,
        width: 156.w,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(7.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4C545F)),
            ),
            Text(
              provider.service,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff4C545F),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xffFF5A36), size: 14),
                const SizedBox(width: 6),
                Text(
                  provider.rating.toString(),
                  style: const TextStyle(
                    fontSize: 12,
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 10,
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
