import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';

// ====== Controller ======
class InvoiceController extends GetxController {
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
class InvoiceListPage extends StatelessWidget {
  InvoiceListPage({super.key});

  // GetX controller
  final InvoiceController controller = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Past Invoices",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
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
