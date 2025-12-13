import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';

import '../../../../../../Utils/AppIcons/app_icons.dart';

// ====== Controller ======
class InvoicePController extends GetxController {
  // RxList for reactive updates
  var invoices = <Map<String, String>>[
    {
      "invoiceNumber": "#12345",
      "date": "12 Jan 2025",
      "dueDate": "20 Jan 2025",
    },
    {
      "invoiceNumber": "#12346",
      "date": "15 Jan 2025",
      "dueDate": "23 Jan 2025",
    },
    {
      "invoiceNumber": "#12347",
      "date": "18 Jan 2025",
      "dueDate": "25 Jan 2025",
    },
  ].obs;

  // Example function to add a new invoice dynamically
  void addInvoice(Map<String, String> invoice) {
    invoices.add(invoice);
  }
}

// ====== View ======
class InvoicePListPage extends StatelessWidget {
  InvoicePListPage({super.key});

  // GetX controller
  final InvoicePController controller = Get.put(InvoicePController());

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: AppColors.FFFFFF,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              AppIcons.chevronleft,
              height: 18.h,
              width: 18.w,
            )),
        title: Padding(
          padding: EdgeInsets.only(left: 89.w),
          child: Text(
            "Invoice",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2937)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
              () => ListView.separated(
            itemCount: controller.invoices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final invoice = controller.invoices[index];

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LEFT SIDE: TEXTS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invoice Number: ${invoice['invoiceNumber']}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1F2937)
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Date: ${invoice['date']}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1F2937)
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Due Date: ${invoice['dueDate']}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1F2937)
                          ),
                        ),
                      ],
                    ),

                    // RIGHT SIDE: DOWNLOAD BUTTON
                    Padding(
                      padding:  EdgeInsets.only(bottom: 25.h),
                      child: Row(
                        children:  [
                          Image.asset(AppImg.download),
                          SizedBox(width: 6),
                          Text(
                            "Download PDF",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.red601,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: Add a new invoice dynamically
          controller.addInvoice({
            "invoiceNumber": "#12348",
            "date": "22 Jan 2025",
            "dueDate": "30 Jan 2025",
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
