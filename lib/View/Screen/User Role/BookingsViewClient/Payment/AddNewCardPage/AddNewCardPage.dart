import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:txme_app/View/Widgegt/Email_Input_Field/CustomTextField.dart';

import '../../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../../Utils/StaticString/static_string.dart';
import '../../../../../../core/App_Routes/app_routes.dart';
import '../../../../../Widgegt/Custom_Button/custom_button.dart';

class AddNewCardPage extends StatelessWidget {
  AddNewCardPage({super.key});

  final TextEditingController cardType = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expiry = TextEditingController();
  final TextEditingController name = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.FFFFFF,
          title: Text("Add New Card")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LABEL
                Text(
                  "Card",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 6),

                // TEXT FIELD
                TextField(
                  controller: cardType,
                  readOnly: true, // user type korbe na
                  decoration: InputDecoration(
                    hintText: "Credit card",
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF6B7280),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                    ),
                  ),
                  onTap: () {
                    _showCardTypeBottomSheet(context);
                  },
                ),
              ],
            ),


            SizedBox(height: 12.h),
            CustomTextFieldC(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  //borderSide: BorderSide(color: Color(0xffCACACA), width: 1.w),
                ),
                color: Color(0xffFFFFFF),
                controller: cardNumber,
                label: "Card number",
                hintText: "Enter 14 digit number",
                readOnly: false),
            SizedBox(
              height: 12.h,
            ),
            CustomTextFieldC(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  //borderSide: BorderSide(color: Color(0xffCACACA), width: 1.w),
                ),
                color: Color(0xffFFFFFF),
                controller: name,
                label: "Card holder name",
                hintText: "Enter name",
                readOnly: false),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                // --------- EXPIRY DATE FIELD ----------
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Card expiry date",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          )),
                      SizedBox(height: 8.h),
                      Container(
                        width: 160.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFCACACA)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: expiry,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: "DD/MM",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 16.w),

                // --------- CVV FIELD ----------
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "CVV",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          )),
                      SizedBox(height: 8.h),
                      Container(
                        width: 160.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFCACACA)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: InputDecoration(
                              hintText: "0000" ,
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              counterText: "",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.h),


            CustomButton(
                height: 56.h,
                width: 353.w,
                BoxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Color(0xffFF5A36),
                ),
                child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xffFFFFFF)),
                    )),
                onTap: () {
                  Get.back(result: {
                    "type": cardType.text,
                    "number": cardNumber.text,
                    "expiry": expiry.text,
                    "name": name.text,
                  });

                }),



            // ElevatedButton(
            //   onPressed: () {
            //     Get.back(result: {
            //       "type": cardType.text,
            //       "number": cardNumber.text,
            //       "expiry": expiry.text,
            //       "name": name.text,
            //     });
            //   },
            //   child: Text("Save Card"),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> _showCardTypeBottomSheet(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Card'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Credit");
            },
            child: Text("Credit"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Debit");
            },
            child: Text("Debit"),
          ),
        ],
      ),
    );

    if (selected != null) {
      cardType.text = selected;
    }
  }


  // void _showCardTypeBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (_) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ListTile(
  //             title: Text("Credit card"),
  //             onTap: () {
  //               cardType.text = "Credit card";
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ListTile(
  //             title: Text("Debit card"),
  //             onTap: () {
  //               cardType.text = "Debit card";
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
