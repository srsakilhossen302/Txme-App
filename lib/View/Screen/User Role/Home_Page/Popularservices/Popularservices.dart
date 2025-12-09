import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Utils/AppImg/app_img.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../../../../Widgegt/CustomContainer/CustomContainer.dart';

class Popularservices extends StatefulWidget {
  const Popularservices({super.key});

  @override
  State<Popularservices> createState() => _PopularservicesState();
}

class _PopularservicesState extends State<Popularservices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Popular services",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff1F2937)),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Customcontainer(cText: "Siding repair", img: AppImg.Sidingrepair),
              Customcontainer(cText: "Home Flooring", img: AppImg.SpinMop),
              Customcontainer(cText: "Plumber", img: AppImg.Plumber01),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Customcontainer(cText: "Carpet", img: AppImg.carpet),
              Customcontainer(cText: "Drilling", img: AppImg.Drilling),
              Customcontainer(cText: "lawn", img: AppImg.lawn),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Customcontainer(cText: AppString.plumbing, img: AppImg.plumber),
              Customcontainer(cText: AppString.painting, img: AppImg.painting),
              Customcontainer(cText: AppString.solar, img: AppImg.solarEnergy),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Customcontainer(
                  cText: AppString.airCondition, img: AppImg.airConditenior),
              Customcontainer(
                  cText: AppString.roofRepair, img: AppImg.roofRepair),
              Customcontainer(
                  cText: AppString.electric, img: AppImg.multimeter),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Customcontainer(cText: "Weedcontrol", img: AppImg.Weedcontrol),
            ],
          ),
        ],
      ),
    );
  }
}
