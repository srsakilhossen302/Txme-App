import 'package:get/get.dart';
import 'BookingspageModel/BookingspageModel.dart';

class BookingspageController extends GetxController {
  RxList<BookingspageModel> bookings = <BookingspageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    // Placeholder data; পরবর্তীতে API কল হবে
    final data = [
      {
        "name": "John Doe",
        "image": "https://i.pravatar.cc/150?img=1",
        "date": "8 Feb 2025",
        "description": "Consultation appointment.",
        "status": "pending",
      },
      {
        "name": "Sarah Parker",
        "image": "https://i.pravatar.cc/150?img=3",
        "date": "12 Feb 2025",
        "description": "Follow-up discussion.",
        "status": "confirmed",
      },
      {
        "name": "Michael Smith",
        "image": "https://i.pravatar.cc/150?img=4",
        "date": "5 Feb 2025",
        "description": "User cancelled the appointment.",
        "status": "cancelled",
      },
    ];

    bookings.value = data.map((e) => BookingspageModel.fromJson(e)).toList();
  }

  List<BookingspageModel> filter(String status) =>
      bookings.where((e) => e.status == status).toList();
}
