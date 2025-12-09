import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/View/Screen/User%20Role/Home_Page/models/review_model.dart';
import 'package:txme_app/View/Widgegt/Custom_Button/custom_button.dart';

import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../models/provider_model.dart';

class DetailsPage extends StatefulWidget {
  final ProviderModel provider;

  const DetailsPage({super.key, required this.provider});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isUserSelected = true;
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Image Section
          Container(
            width: 393.w,
            height: 344.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
              child: widget.provider.image.startsWith("http")
                  ? Image.network(
                      widget.provider.image,
                      width: 393.w,
                      height: 344.h,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      widget.provider.image,
                      width: 393.w,
                      height: 344.h,
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 210.w),
                  child: Text(
                    widget.provider.name,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4C545F)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 270.w),
                  child: Text(
                    widget.provider.service,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff4C545F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Rating / Orders / Experience

                Container(
                  width: 353.w,
                  height: 103.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray.withOpacity(0.3),
                        blurRadius: 12.r,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _infoColumn(
                          AppImg.star, widget.provider.rating, "Rating"),
                      _infoColumn(
                          AppImg.completed, widget.provider.orders, "Orders"),
                      _infoColumn(AppImg.experience, widget.provider.experience,
                          "Years"),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skills",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xff565656),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: widget.provider.skills.map((skill) {
                        int index = widget.provider.skills.indexOf(skill);
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index == widget.provider.skills.length - 1
                                  ? 0
                                  : 10.w), // last element-এর পরে gap নেই
                          child: Container(
                            height: 30.h, // fixed height
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w), // width text অনুযায়ী
                            decoration: BoxDecoration(
                              color: Color(0xffF7F7F7),
                              borderRadius: BorderRadius.circular(6.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gray.withOpacity(0.2),
                                  blurRadius: 12.r,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                skill,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff565656),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Color(0xff4C545F)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 60.w),
                          child: Text(
                            "Rate",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Color(0xff4C545F)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Color(0xffF7F7F7),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gray.withOpacity(0.2),
                                    blurRadius: 12.r,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                widget.provider.availableFrom,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4C545F)),
                              )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4C545F)),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 60.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Color(0xffF7F7F7),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gray.withOpacity(0.2),
                                    blurRadius: 12.r,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                widget.provider.availableTo,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4C545F)),
                              )),
                            ),
                          ],
                        ),
                        Container(
                          width: 95.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gray.withOpacity(0.2),
                                blurRadius: 12.r,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "\$${widget.provider.rate} (Hourly)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4C545F),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                // Bio
                Padding(
                  padding:  EdgeInsets.only(right: 120.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bio",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.provider.bio,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Color(0xff4C545F)),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showAll = !showAll; // toggle true/false
                            });
                          },
                          child: Text(
                            showAll ? "Show less" : "Show all",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: (showAll
                              ? widget.provider.reviews
                              : widget.provider.reviews.take(2).toList())
                          .map((review) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: review.profile.startsWith("http")
                                        ? Image.network(
                                            review.profile,
                                            width: 24.w,
                                            height: 24.h,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            review.profile,
                                            width: 24.w,
                                            height: 24.h,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    review.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ),
                                  Spacer(),
                                  Text(
                                    review.date,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),

                              // ⭐ Rating stars added here
                              SizedBox(height: 4.h),
                              buildStarRating(review
                                  .rating), // <-- review.rating অনুযায়ী star

                              SizedBox(height: 4.h),
                              Text(
                                review.comment,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                CustomButton(
                    height: 56.h,
                    width: 353.w,
                    BoxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color:
                          isUserSelected ? AppColors.red601 : Color(0xffFFEFEB),
                      border: Border.all(color: AppColors.red601, width: 1.w),
                    ),
                    child: Center(
                        child: Text(
                      "Request Booking",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isUserSelected
                            ? AppColors.FFFFFF
                            : AppColors.black900,
                      ),
                    )),
                    onTap: () {
                      setState(() {
                        isUserSelected = true;
                      });
                    }),
                SizedBox(
                  height: 20.h,
                ),

                CustomButton(
                    height: 56.h,
                    width: 353.w,
                    BoxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: !isUserSelected
                          ? AppColors.red601
                          : Color(0xffFFEFEB),
                      border: Border.all(color: AppColors.red601, width: 1.w),
                    ),
                    child: Center(
                        child: Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isUserSelected
                            ? AppColors.black900
                            : AppColors.FFFFFF,
                      ),
                    )),
                    onTap: () {
                      setState(() {
                        isUserSelected = false;
                      });
                    }),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
    );
  }

  Widget buildStarRating(double rating) {
    rating = rating.clamp(0.0, 5.0);

    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Color(0xffFF5A36), size: 16));
    }

    if (hasHalfStar) {
      stars
          .add(const Icon(Icons.star_half, color: Color(0xffFF5A36), size: 16));
    }

    int remaining = 5 - stars.length;
    for (int i = 0; i < remaining; i++) {
      stars.add(
          const Icon(Icons.star_border, color: Color(0xffD9D9D9), size: 16));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }

  Widget _infoColumn(String icon, dynamic value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon),
        Text(
          value.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(label),
      ],
    );
  }
}
